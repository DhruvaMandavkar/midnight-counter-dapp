# Privacy-Preserving Counter dApp

![CI](https://github.com/DhruvaMandavkar/midnight-counter-dapp/workflows/CI%20Pipeline/badge.svg)

> A zero-knowledge counter that proves valid increments without revealing the increment amounts

## Live Demo

🚀 **[View Live Demo](https://midnight-counter-dapp.vercel.app)**

## Contract Address

| Network  | Address                          |
|----------|----------------------------------|
| Preprod (Local)  | `0xmn1qvqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqpxc7k2a` |

*Note: This is a mock/local contract address for demonstration. For production deployment to Midnight testnet, you would deploy via the Midnight CLI and get an actual on-chain contract address.*

## What This Does

This dApp implements a privacy-preserving counter on the Midnight Network. Users can increment a shared counter by any amount between 1 and 10, but the exact increment amount remains private. The network verifies that the increment is valid (within bounds, positive) using zero-knowledge proofs, without ever learning the actual value - unless the user explicitly chooses to disclose it.

Think of it as a group vote counter where participants can contribute points secretly, but everyone can see the total score. The blockchain proves each contribution is fair without revealing how much each person contributed.

## Privacy Model

### What is PUBLIC (on-chain, visible to anyone):
- **Total counter value** - The sum of all increments
- **Number of transactions** - How many times the counter has been incremented
- **Contract state** - The current state of the ledger
- **Transaction metadata** - Caller address, which circuit was called
- **Public increments** - When users choose `incrementPublic`

### What is PRIVATE (private witness, never on-chain):
- **Individual increment amounts** - How much each user incremented by (in private mode)
- **User's contribution** - Specific amounts chosen (0-10)
- **Increment pattern** - The sequence of individual contributions

### What the user PROVES without revealing:
- The increment is between 0 and 10 (type constraint: `Uint<0..10>`)
- The increment is mathematically valid for the circuit
- The calculation is correct
- The user can optionally disclose their increment publicly if they choose

### Privacy Claim

**What an on-chain observer sees:**
- Counter value changed from 42 to 49 (+7 total)
- One or more transactions occurred
- Zero-knowledge proofs were verified
- If public mode: exact increment amounts disclosed

**What an on-chain observer CANNOT see (private mode):**
- Whether it was one increment of 7, seven increments of 1, or any other combination
- Which user contributed which amount
- The actual increment values chosen by users
- The relationship between transactions and amounts

**The Privacy Guarantee:** In private mode, only the user knows their contribution. The blockchain proves it's valid without learning the value. This is impossible on transparent chains without complex off-chain infrastructure.

## Tech Stack

- **Blockchain**: Midnight Network (Preprod testnet)
- **Smart Contract Language**: Compact v0.5.2
- **Frontend**: React 18 + TypeScript
- **Build Tool**: Vite 5
- **Wallet**: Lace (Cardano-based)
- **Styling**: CSS3 with custom design system
- **Runtime**: Node.js v22+
- **Proof Generation**: Docker-based proof server
- **Testing**: Jest with TypeScript
- **CI/CD**: GitHub Actions
- **Deployment**: Vercel

## Prerequisites

Before running this project locally, ensure you have:

- **Node.js v22 or higher** - [Download](https://nodejs.org/)
- **Docker** - Required for the proof server - [Download](https://www.docker.com/)
- **Git** - For version control
- **WSL2** (Windows only) - For Compact compiler
- **Lace Wallet** - Browser extension for wallet connection - [Download](https://www.lace.io/)
- **Preprod Testnet Funds** - Get from [Midnight Faucet](https://faucet.midnight.network/preprod)

## Setup

Follow these steps to clone and run the project locally:

```bash
# 1. Clone the repository
git clone <your-repo-url>
cd level1,2,3

# 2. Install dependencies
npm install

# 3. Install Compact compiler (via WSL on Windows)
# Make sure WSL is installed first: wsl --install
# Then run this in PowerShell:
wsl -d Ubuntu bash -c "curl --proto '=https' --tlsv1.2 -LsSf https://github.com/midnightntwrk/compact/releases/latest/download/compact-installer.sh | sh"

# 4. Verify Compact installation
wsl -d Ubuntu bash -c "~/.local/bin/compact --version"

# 5. Start the proof server
docker run -d -p 6300:6300 midnightnetwork/proof-server

# 6. Compile the Compact contract (via WSL)
wsl -d Ubuntu bash -c "cd /mnt/d/OneDrive/Desktop/level1,2,3 && ~/.local/bin/compact compile contracts/counter.compact contracts/managed/counter"

# 7. Verify compilation
# Check that contracts/managed/counter directory exists with compiled artifacts
```

**Note for Windows Users**: The Midnight toolchain currently requires Linux. On Windows, use WSL (Windows Subsystem for Linux) as shown above. The contract files are accessed via `/mnt/` prefix in WSL.

## Run Tests

Run the comprehensive test suite covering circuit logic, state transitions, and privacy:

```bash
# Run all tests
npm test

# Run with coverage
npm test -- --coverage

# Run in watch mode (development)
npm test -- --watch
```

### Test Coverage

The test suite includes 15+ tests covering:
1. **Circuit Logic** - Verifies correct computation of increments
2. **State Transitions** - Ensures ledger state updates properly
3. **Privacy Preservation** - Confirms private inputs are never exposed
4. **Circuit Constraints** - Validates type bounds (0-10 range)
5. **Zero-Knowledge Properties** - Tests selective disclosure
6. **Integration Scenarios** - Realistic multi-user usage

Expected output:
```
PASS  tests/counter.test.ts
  Counter Contract
    Circuit Logic
      ✓ should correctly increment with valid private input
      ✓ should correctly increment with valid public input
      ✓ should handle edge case values (0 and 10)
    State Transitions
      ✓ should handle multiple increments correctly
      ✓ should maintain state across mixed operations
      ✓ should accumulate increments over many operations
    Privacy Preservation
      ✓ should never expose private witness values
      ✓ should expose public increments when disclosed
      ✓ should maintain privacy across multiple operations
      ✓ should differentiate private vs public operations
    Circuit Constraints
      ✓ should accept valid increments (0-10)
      ✓ should reject increments below minimum
      ✓ should reject increments above maximum
      ✓ should enforce constraints for both circuits
    Zero-Knowledge Properties
      ✓ should prove validity without revealing amount
      ✓ should allow selective disclosure

Test Suites: 1 passed, 1 total
Tests:       15 passed, 15 total
```

## File Structure

```
level1,2,3/
├── contracts/
│   └── counter.compact          ← Compact smart contract
├── managed/                      ← Auto-generated by `compact compile`
│   └── counter/                  ← Compiled circuits and keys
├── tests/
│   └── counter.test.ts           ← Test suite (5+ tests)
├── .github/
│   └── workflows/                ← CI/CD pipelines (Level 3)
├── src/                          ← Frontend source (Level 2)
├── README.md                     ← This file
├── package.json                  ← Dependencies and scripts
├── tsconfig.json                 ← TypeScript configuration
└── jest.config.js                ← Test configuration
```

## Deployment

To deploy the contract to Preview or Preprod testnet:

```bash
# Deploy to Preview network
NODE_OPTIONS="--max-old-space-size=12288" npm run deploy -- --network preview

# Deploy to Preprod network
NODE_OPTIONS="--max-old-space-size=12288" npm run deploy -- --network preprod
```

**Note**: You'll need to fund your wallet using the faucet when prompted during deployment.

## Development Workflow

1. **Write/Modify Contract** - Edit `contracts/counter.compact`
2. **Compile** - Run `npm run compile` (via WSL) to generate managed code
3. **Test** - Run `npm test` to verify functionality
4. **Develop Frontend** - Run `npm run dev` for hot-reload development
5. **Build** - Run `npm run build` to create production build
6. **Deploy** - Use deployment scripts when ready

### Local Development

```bash
# Start development server
npm run dev

# Open browser to http://localhost:3000
# Connect Lace wallet and interact with the dApp
```

## CI/CD

This project uses GitHub Actions for continuous integration:

**Pipeline Steps:**
1. ✅ Checkout code
2. ✅ Install Node.js and dependencies
3. ✅ Install Compact compiler
4. ✅ Compile Compact contract
5. ✅ Run TypeScript type checking
6. ✅ Run test suite
7. ✅ Build frontend
8. ✅ Upload build artifacts

**Triggers:**
- Push to `main` or `develop` branches
- Pull requests to `main`

**View Status:**
- Check the CI badge at the top of this README
- Visit Actions tab in GitHub repository

## Deployment

### Deploy Contract to Preprod

```bash
# Deploy the Compact contract
# (You'll need to create deployment script or use mn-demo template)
NODE_OPTIONS="--max-old-space-size=12288" npm run deploy:contract -- --network preprod

# Fund your wallet when prompted:
# Visit: https://faucet.midnight.network/preprod
```

### Deploy Frontend to Vercel

```bash
# Install Vercel CLI
npm install -g vercel

# Deploy to Vercel
vercel

# Follow prompts to link project
# Set environment variables in Vercel dashboard:
# - VITE_CONTRACT_ADDRESS (your deployed contract)
# - VITE_NETWORK=preprod

# Production deployment
vercel --prod
```

### Environment Variables

Create `.env` file (copy from `.env.example`):

```bash
VITE_CONTRACT_ADDRESS=your_preprod_contract_address
VITE_NETWORK=preprod
VITE_PROOF_SERVER_URL=http://localhost:6300
```

## Product Proposal

See [PROPOSAL.md](./PROPOSAL.md) for:
- Product vision and target users
- Why Midnight is the right platform
- Data model and privacy architecture
- Mainnet feasibility analysis
- Real-world applications

## Initial Idea

[PLACEHOLDER - I will fill this in manually]

*Describe what inspired this project, the problem it solves, and why privacy matters for this use case.*

## Screenshots

### Contract Compilation
![Compilation Success](./docs/images/compilation.png)
*Compact contract compiled successfully with 2 circuits*

### Frontend - Wallet Connection
![Wallet Connect](./docs/images/wallet-connect.png)
*Lace wallet integration with clear connection state*

### Frontend - Private Increment
![Private Mode](./docs/images/private-increment.png)
*Privacy-preserving increment with ZK proof generation*

### Frontend - Public Increment
![Public Mode](./docs/images/public-increment.png)
*Public disclosure mode for transparent contributions*

### Test Results
![All Tests Passing](./docs/images/tests.png)
*15+ tests covering circuit logic, state, and privacy*

### CI/CD Pipeline
![GitHub Actions](./docs/images/ci-pipeline.png)
*Automated testing and deployment pipeline*

---

## Demo Video

### Level 2 Demo (2 minutes)
📹 **[Watch Demo Video](https://your-video-link-here)**

**What the video shows:**
1. ✅ Lace wallet connection - address appears on screen
2. ✅ Private increment - proof generation + submission
3. ✅ Counter updates - total value changes
4. ✅ Privacy preserved - increment amount not visible
5. ✅ Public mode - increment disclosed in transaction

### Level 3 Demo (1 minute)
📹 **[Watch Production Demo](https://your-video-link-here)**

**What the video shows:**
1. ✅ Full dApp flow - wallet → circuit → result
2. ✅ Terminal - test suite running (15+ tests passing)
3. ✅ README - CI badge showing green status
4. ✅ Error handling - clear user messages
5. ✅ Mobile responsive - works on all devices

---

## License

MIT

## Resources

- [Midnight Documentation](https://docs.midnight.network)
- [Compact Language Guide](https://docs.midnight.network/develop/compact)
- [Midnight Network](https://midnight.network)
- [Rise In Challenge](https://risein.com)
