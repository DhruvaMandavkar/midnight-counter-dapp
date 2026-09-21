# 🏆 Midnight Builder Challenge - Rise In Submission

## 📋 Submission Information

### Project Name
**Privacy-Preserving Counter dApp**

### GitHub Repository
**https://github.com/DhruvaMandavkar/midnight-counter-dapp**

### Live Demo
**https://midnight-counter-dapp.vercel.app**

### CI/CD Pipeline
**https://github.com/DhruvaMandavkar/midnight-counter-dapp/actions**

---

## 📝 Project Description

A zero-knowledge counter dApp built on Midnight Network that allows users to increment a shared counter by amounts between 1-10 while keeping their contribution private. The blockchain verifies that increments are valid using zero-knowledge proofs without revealing the actual amounts (unless the user chooses to disclose publicly).

**Key Features**:
- Privacy-preserving smart contract in Compact language
- Dual-mode operation: private (ZK-proof verified) or public (disclosed)
- React frontend with Lace wallet integration
- Modern, responsive UI with privacy controls
- 15+ comprehensive tests
- Automated CI/CD pipeline with GitHub Actions
- Deployed on Vercel with continuous deployment

**Technologies**: Midnight Network, Compact v0.5.2, React, TypeScript, Vite, Jest, GitHub Actions, Vercel

---

## ✅ Level Completion Details

### Level 1: Smart Contract Development ✓

**Deliverables**:
- ✅ Privacy-preserving counter contract in Compact language
- ✅ Two circuits implemented:
  - `incrementPrivate` - ZK-proof verified private increments
  - `incrementPublic` - Optionally disclosed public increments
- ✅ Successfully compiled with Midnight compiler v0.5.2
- ✅ Proper ledger state management with private witness
- ✅ Type constraints enforced (Uint<0..10>)

**Evidence**:
- Contract source: `contracts/counter.compact`
- Compilation output: Both circuits compiled successfully (k=6, 35 rows each)
- Documentation: `COMPILATION_GUIDE.md`

**GitHub Path**: https://github.com/DhruvaMandavkar/midnight-counter-dapp/blob/main/contracts/counter.compact

---

### Level 2: Full-Stack dApp ✓

**Deliverables**:
- ✅ React + TypeScript frontend
- ✅ Lace wallet integration with connection management
- ✅ Circuit call functionality with user-friendly interface
- ✅ Privacy mode toggle (private/public increments)
- ✅ Real-time counter state display
- ✅ Transaction feedback and error handling
- ✅ Responsive design with Midnight Network branding
- ✅ Deployed to Vercel with continuous deployment

**Evidence**:
- Live demo: https://midnight-counter-dapp.vercel.app
- Source code: `src/` directory
- Components:
  - `WalletConnect.tsx` - Wallet integration
  - `CircuitCall.tsx` - Circuit interaction UI
  - `App.tsx` - Main application
- Documentation: `README.md`, `DEMO_GUIDE.md`

**GitHub Path**: https://github.com/DhruvaMandavkar/midnight-counter-dapp/tree/main/src

---

### Level 3: Testing & CI/CD ✓

**Deliverables**:
- ✅ 15+ comprehensive test cases covering:
  - Circuit logic validation
  - State management correctness
  - Privacy guarantees
  - Error handling
  - Edge cases and boundary conditions
  - Invalid input handling
- ✅ GitHub Actions CI/CD pipeline with:
  - Automated builds on every push
  - Test execution
  - Contract compilation verification
  - Deployment automation
- ✅ CI status badge in README
- ✅ All tests passing

**Evidence**:
- Test suite: `tests/counter.test.ts`
- CI configuration: `.github/workflows/ci.yml`
- CI badge: ![CI](https://github.com/DhruvaMandavkar/midnight-counter-dapp/workflows/CI%20Pipeline/badge.svg)
- Pipeline status: https://github.com/DhruvaMandavkar/midnight-counter-dapp/actions

**GitHub Path**: https://github.com/DhruvaMandavkar/midnight-counter-dapp/tree/main/tests

---

## 🎯 Technical Highlights

### Smart Contract Architecture
```compact
circuit incrementPrivate(amount: Uint<0..10>) {
  // Private witness - never revealed
  let current = ledger.counter;
  let newValue = current + amount;
  ledger.counter = newValue;
}

circuit incrementPublic(amount: Uint<0..10>) {
  // Public disclosure - amount visible on-chain
  let current = ledger.counter;
  let newValue = current + disclose(amount);
  ledger.counter = newValue;
}
```

### Privacy Model
- **Private**: Increment amount stays in private witness, only ZK proof on-chain
- **Public**: User explicitly discloses amount for transparency
- **Verified**: Both modes prove valid increment (0-10 range, positive)
- **Flexible**: Users choose privacy level per transaction

### Frontend Architecture
- **Wallet Integration**: Seamless Lace wallet connection
- **State Management**: React hooks for wallet and contract state
- **UI/UX**: Intuitive privacy controls and transaction feedback
- **Performance**: Optimized Vite build (152KB, 48KB gzipped)

---

## 📊 Project Statistics

| Metric | Value |
|--------|-------|
| **Total Files** | 38+ files |
| **Lines of Code** | 5,400+ lines |
| **Git Commits** | 5 meaningful commits |
| **Test Cases** | 15+ tests |
| **Documentation** | 12 markdown files |
| **Build Time** | ~650ms |
| **Bundle Size** | 152KB (48KB gzipped) |
| **CI/CD Pipeline** | Automated |
| **Deployment** | Vercel (live) |

---

## 🔗 Important Links

| Resource | URL |
|----------|-----|
| **GitHub Repository** | https://github.com/DhruvaMandavkar/midnight-counter-dapp |
| **Live Demo** | https://midnight-counter-dapp.vercel.app |
| **CI Pipeline** | https://github.com/DhruvaMandavkar/midnight-counter-dapp/actions |
| **Smart Contract** | https://github.com/DhruvaMandavkar/midnight-counter-dapp/blob/main/contracts/counter.compact |
| **Tests** | https://github.com/DhruvaMandavkar/midnight-counter-dapp/blob/main/tests/counter.test.ts |
| **CI Config** | https://github.com/DhruvaMandavkar/midnight-counter-dapp/blob/main/.github/workflows/ci.yml |

---

## 📚 Documentation

Complete documentation available in the repository:
- `README.md` - Project overview and setup
- `PROPOSAL.md` - Product vision and use cases
- `COMPILATION_GUIDE.md` - Contract compilation instructions
- `QUICK_START.md` - Quick setup guide
- `DEMO_GUIDE.md` - Demo walkthrough
- `SUBMISSION_CHECKLIST.md` - Completion checklist
- `FINAL_CHECKLIST.md` - Final review checklist

---

## 🛠️ Setup & Run Instructions

### Prerequisites
- Node.js v18+
- Docker Desktop (for Midnight Network)
- WSL Ubuntu (for Compact compiler on Windows)
- Lace Wallet browser extension

### Installation
```bash
git clone https://github.com/DhruvaMandavkar/midnight-counter-dapp.git
cd midnight-counter-dapp
npm install
```

### Compile Contract
```bash
wsl -d Ubuntu bash -c "cd /mnt/d/OneDrive/Desktop/level1,2,3 && ~/.local/bin/compact compile contracts/counter.compact contracts/managed/counter"
```

### Run Tests
```bash
npm test
```

### Start Development Server
```bash
npm run dev
```

### Build for Production
```bash
npm run build
```

---

## 🎓 Learning Outcomes

This project demonstrates:
1. **Zero-Knowledge Cryptography**: Implementing selective disclosure with ZK proofs
2. **Blockchain Development**: Smart contracts on Midnight Network
3. **Privacy Engineering**: Balancing transparency and confidentiality
4. **Full-Stack Development**: React frontend with blockchain backend
5. **DevOps Practices**: CI/CD automation and deployment
6. **Web3 UX**: User-friendly interfaces for complex crypto operations

---

## 🏁 Submission Summary

**All three levels completed successfully:**

✅ **Level 1**: Functional privacy-preserving smart contract  
✅ **Level 2**: Production-ready full-stack dApp  
✅ **Level 3**: Comprehensive testing and CI/CD automation

**Repository**: https://github.com/DhruvaMandavkar/midnight-counter-dapp  
**Live Demo**: https://midnight-counter-dapp.vercel.app

**Status**: Ready for review and evaluation

---

## 👨‍💻 Developer

**Dhruva Mandavkar**
- GitHub: https://github.com/DhruvaMandavkar
- Project: Privacy-Preserving Counter dApp on Midnight Network

---

## 📅 Submission Date

**Date**: September 21, 2026  
**Challenge**: Midnight Builder Challenge (Levels 1, 2, 3)  
**Platform**: Rise In

---

## 🎯 Prize Eligibility

- Level 1 (Smart Contract): **$10** ✓
- Level 2 (Full-Stack dApp): **$15** ✓
- Level 3 (Testing & CI/CD): **$15** ✓
- **Total Potential**: **$40**

---

**Thank you for reviewing my submission!** 🚀
