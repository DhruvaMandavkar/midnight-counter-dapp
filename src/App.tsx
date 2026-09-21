import { useState } from 'react';
import WalletConnect from './components/WalletConnect';
import CircuitCall from './components/CircuitCall';
import './App.css';

function App() {
  const [isConnected, setIsConnected] = useState(false);
  const [walletAddress, setWalletAddress] = useState<string>('');

  const handleConnect = (address: string) => {
    setIsConnected(true);
    setWalletAddress(address);
  };

  const handleDisconnect = () => {
    setIsConnected(false);
    setWalletAddress('');
  };

  return (
    <div className="app">
      {/* Header */}
      <header className="header">
        <div className="container">
          <div className="header-content">
            <div className="logo">
              <div className="logo-icon">🌙</div>
              <h1>Midnight Counter</h1>
            </div>
            <WalletConnect
              isConnected={isConnected}
              walletAddress={walletAddress}
              onConnect={handleConnect}
              onDisconnect={handleDisconnect}
            />
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <main className="main">
        <div className="container">
          <section className="hero">
            <div className="hero-badge">
              <span className="badge-dot"></span>
              Zero-Knowledge Proof
            </div>
            <h2 className="hero-title">
              Privacy-Preserving Counter
            </h2>
            <p className="hero-description">
              Increment a shared counter by a secret amount (0-10). The network proves your increment is valid{' '}
              <strong>without revealing the exact value</strong>. Choose to increment privately or publicly.
            </p>

            {/* Privacy Highlight */}
            <div className="privacy-highlight">
              <div className="privacy-icon">🔒</div>
              <div>
                <div className="privacy-title">Your Privacy is Protected</div>
                <div className="privacy-text">
                  Private inputs are never exposed. The blockchain only sees the total counter value.
                </div>
              </div>
            </div>
          </section>

          {/* Main Content */}
          {isConnected ? (
            <CircuitCall walletAddress={walletAddress} />
          ) : (
            <div className="connect-prompt">
              <div className="connect-card">
                <div className="connect-icon">🦊</div>
                <h3>Connect Your Wallet</h3>
                <p>Connect your Lace wallet to start interacting with the counter contract</p>
                <ul className="connect-features">
                  <li>✅ Private increments with ZK proofs</li>
                  <li>✅ Choose public or private mode</li>
                  <li>✅ Prove validity without revealing values</li>
                </ul>
              </div>
            </div>
          )}
        </div>
      </main>

      {/* Footer */}
      <footer className="footer">
        <div className="container">
          <div className="footer-content">
            <p>Built on <a href="https://midnight.network" target="_blank" rel="noopener noreferrer">Midnight Network</a></p>
            <div className="footer-links">
              <a href="https://docs.midnight.network" target="_blank" rel="noopener noreferrer">Docs</a>
              <span>•</span>
              <a href="https://github.com" target="_blank" rel="noopener noreferrer">GitHub</a>
            </div>
          </div>
        </div>
      </footer>
    </div>
  );
}

export default App;
