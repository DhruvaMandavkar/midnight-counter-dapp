import { useState } from 'react';
import './WalletConnect.css';

interface WalletConnectProps {
  isConnected: boolean;
  walletAddress: string;
  onConnect: (address: string) => void;
  onDisconnect: () => void;
}

function WalletConnect({ isConnected, walletAddress, onConnect, onDisconnect }: WalletConnectProps) {
  const [isConnecting, setIsConnecting] = useState(false);
  const [error, setError] = useState<string>('');

  const handleConnect = async () => {
    setIsConnecting(true);
    setError('');

    try {
      // Check if Lace wallet is installed
      if (!window.cardano || !window.cardano.lace) {
        setError('Lace wallet not found. Please install Lace wallet extension.');
        setIsConnecting(false);
        return;
      }

      // Enable Lace wallet
      const lace = window.cardano.lace;
      const api = await lace.enable();

      // Get wallet address
      const addresses = await api.getUsedAddresses();
      if (addresses && addresses.length > 0) {
        const address = addresses[0];
        onConnect(address.slice(0, 12) + '...' + address.slice(-8));
      } else {
        setError('No addresses found in wallet');
      }
    } catch (err: any) {
      console.error('Wallet connection error:', err);
      
      if (err.code === -1) {
        setError('User rejected wallet connection');
      } else if (err.code === -2) {
        setError('Wallet not available');
      } else if (err.info && err.info.includes('network')) {
        setError('Wrong network. Please switch to Preprod network in Lace.');
      } else {
        setError('Failed to connect wallet. Please try again.');
      }
    } finally {
      setIsConnecting(false);
    }
  };

  const handleDisconnect = () => {
    onDisconnect();
    setError('');
  };

  const formatAddress = (address: string) => {
    if (!address) return '';
    return address;
  };

  if (isConnected) {
    return (
      <div className="wallet-connected">
        <div className="wallet-status">
          <div className="status-indicator"></div>
          <span className="wallet-address">{formatAddress(walletAddress)}</span>
        </div>
        <button className="btn btn-secondary" onClick={handleDisconnect}>
          Disconnect
        </button>
      </div>
    );
  }

  return (
    <div className="wallet-connect">
      <button 
        className="btn btn-primary" 
        onClick={handleConnect}
        disabled={isConnecting}
      >
        {isConnecting ? (
          <>
            <div className="spinner"></div>
            Connecting...
          </>
        ) : (
          <>
            <span className="wallet-icon">🦊</span>
            Connect Lace Wallet
          </>
        )}
      </button>
      
      {error && (
        <div className="wallet-error">
          <div className="error-icon">⚠️</div>
          <div className="error-content">
            <div className="error-title">Connection Failed</div>
            <div className="error-message">{error}</div>
            {error.includes('not found') && (
              <a 
                href="https://www.lace.io/" 
                target="_blank" 
                rel="noopener noreferrer"
                className="error-link"
              >
                Download Lace Wallet →
              </a>
            )}
          </div>
        </div>
      )}
    </div>
  );
}

// Type definitions for Lace wallet
declare global {
  interface Window {
    cardano?: {
      lace?: {
        enable: () => Promise<{
          getUsedAddresses: () => Promise<string[]>;
          getNetworkId: () => Promise<number>;
        }>;
        isEnabled: () => Promise<boolean>;
      };
    };
  }
}

export default WalletConnect;
