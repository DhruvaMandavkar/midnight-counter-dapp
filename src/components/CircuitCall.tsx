import { useState, useEffect } from 'react';
import './CircuitCall.css';

interface CircuitCallProps {
  walletAddress: string;
}

function CircuitCall({ walletAddress }: CircuitCallProps) {
  const [counterValue, setCounterValue] = useState<number>(0);
  const [incrementAmount, setIncrementAmount] = useState<number>(5);
  const [isPrivate, setIsPrivate] = useState<boolean>(true);
  const [isLoading, setIsLoading] = useState<boolean>(false);
  const [result, setResult] = useState<string>('');
  const [error, setError] = useState<string>('');
  const [txHash, setTxHash] = useState<string>('');

  // Simulated contract address (replace with actual after deployment)
  const CONTRACT_ADDRESS = import.meta.env.VITE_CONTRACT_ADDRESS || 'Not deployed yet';

  // Fetch current counter value (simulated)
  useEffect(() => {
    fetchCounterValue();
  }, []);

  const fetchCounterValue = async () => {
    try {
      // TODO: Replace with actual contract call
      // For now, simulate reading from contract
      const simulatedValue = Math.floor(Math.random() * 100);
      setCounterValue(simulatedValue);
    } catch (err) {
      console.error('Failed to fetch counter value:', err);
    }
  };

  const handleIncrement = async () => {
    setIsLoading(true);
    setResult('');
    setError('');
    setTxHash('');

    try {
      // Step 1: Generate proof locally
      setResult('Generating zero-knowledge proof...');
      await simulateProofGeneration();

      // Step 2: Submit transaction
      setResult('Submitting transaction to Preprod...');
      await simulateTransaction();

      // Step 3: Update counter
      const newValue = counterValue + incrementAmount;
      setCounterValue(newValue);

      // Step 4: Show result
      const mode = isPrivate ? 'private' : 'public';
      setResult(`Successfully incremented counter by ${incrementAmount} (${mode} mode)`);
      setTxHash('0x' + Math.random().toString(16).substring(2, 34));

    } catch (err: any) {
      console.error('Circuit call error:', err);
      setError(err.message || 'Failed to execute circuit. Please try again.');
    } finally {
      setIsLoading(false);
    }
  };

  const simulateProofGeneration = () => {
    return new Promise((resolve) => {
      // Simulate proof generation time (2-5 seconds)
      const duration = 2000 + Math.random() * 3000;
      setTimeout(resolve, duration);
    });
  };

  const simulateTransaction = () => {
    return new Promise((resolve) => {
      // Simulate transaction time (1-3 seconds)
      const duration = 1000 + Math.random() * 2000;
      setTimeout(resolve, duration);
    });
  };

  return (
    <div className="circuit-call">
      {/* Counter Display */}
      <div className="counter-display">
        <div className="counter-label">Current Counter Value</div>
        <div className="counter-value">{counterValue}</div>
        <div className="counter-subtitle">
          Public ledger state • Visible to everyone
        </div>
      </div>

      {/* Control Panel */}
      <div className="control-panel">
        <div className="panel-header">
          <h3>Increment Counter</h3>
          <p>Choose your increment amount and privacy level</p>
        </div>

        {/* Amount Selector */}
        <div className="form-group">
          <label htmlFor="amount">
            Increment Amount
            <span className="label-badge">0-10</span>
          </label>
          <div className="amount-selector">
            <button 
              className="amount-btn"
              onClick={() => setIncrementAmount(Math.max(0, incrementAmount - 1))}
              disabled={incrementAmount <= 0 || isLoading}
            >
              −
            </button>
            <input
              id="amount"
              type="number"
              min="0"
              max="10"
              value={incrementAmount}
              onChange={(e) => {
                const val = parseInt(e.target.value) || 0;
                setIncrementAmount(Math.min(10, Math.max(0, val)));
              }}
              className="amount-input"
              disabled={isLoading}
            />
            <button 
              className="amount-btn"
              onClick={() => setIncrementAmount(Math.min(10, incrementAmount + 1))}
              disabled={incrementAmount >= 10 || isLoading}
            >
              +
            </button>
          </div>
        </div>

        {/* Privacy Mode Toggle */}
        <div className="form-group">
          <label>Privacy Mode</label>
          <div className="privacy-toggle">
            <button
              className={`toggle-option ${isPrivate ? 'active' : ''}`}
              onClick={() => setIsPrivate(true)}
              disabled={isLoading}
            >
              <div className="option-icon">🔒</div>
              <div className="option-content">
                <div className="option-title">Private</div>
                <div className="option-desc">Increment stays hidden</div>
              </div>
            </button>
            <button
              className={`toggle-option ${!isPrivate ? 'active' : ''}`}
              onClick={() => setIsPrivate(false)}
              disabled={isLoading}
            >
              <div className="option-icon">👁️</div>
              <div className="option-content">
                <div className="option-title">Public</div>
                <div className="option-desc">Increment is disclosed</div>
              </div>
            </button>
          </div>
        </div>

        {/* Privacy Explanation */}
        <div className={`privacy-explanation ${isPrivate ? 'private' : 'public'}`}>
          <div className="explanation-icon">
            {isPrivate ? '🔐' : '📢'}
          </div>
          <div className="explanation-text">
            {isPrivate ? (
              <>
                <strong>Proved without revealing:</strong> Your increment amount remains completely private.
                The network verifies it's valid (0-10) using zero-knowledge proofs.
              </>
            ) : (
              <>
                <strong>Public disclosure:</strong> Your increment amount will be visible on-chain.
                Useful when transparency is desired.
              </>
            )}
          </div>
        </div>

        {/* Submit Button */}
        <button
          className="btn btn-primary btn-large"
          onClick={handleIncrement}
          disabled={isLoading}
        >
          {isLoading ? (
            <>
              <div className="spinner"></div>
              Processing...
            </>
          ) : (
            <>
              <span className="btn-icon">⚡</span>
              Execute Circuit
            </>
          )}
        </button>

        {/* Loading State */}
        {isLoading && (
          <div className="loading-state">
            <div className="loading-steps">
              <div className="loading-step active">
                <div className="step-spinner"></div>
                <span>Generating ZK proof locally...</span>
              </div>
            </div>
            <div className="loading-note">
              ⏱️ This may take 10-30 seconds
            </div>
          </div>
        )}

        {/* Result */}
        {result && !error && (
          <div className="result success">
            <div className="result-icon">✅</div>
            <div className="result-content">
              <div className="result-title">Success!</div>
              <div className="result-message">{result}</div>
              {txHash && (
                <div className="result-tx">
                  Transaction: <code>{txHash}</code>
                </div>
              )}
            </div>
          </div>
        )}

        {/* Error */}
        {error && (
          <div className="result error">
            <div className="result-icon">❌</div>
            <div className="result-content">
              <div className="result-title">Error</div>
              <div className="result-message">{error}</div>
            </div>
          </div>
        )}
      </div>

      {/* Contract Info */}
      <div className="contract-info">
        <div className="info-row">
          <span className="info-label">Contract Address:</span>
          <code className="info-value">{CONTRACT_ADDRESS}</code>
        </div>
        <div className="info-row">
          <span className="info-label">Network:</span>
          <span className="info-value">Preprod Testnet</span>
        </div>
        <div className="info-row">
          <span className="info-label">Your Wallet:</span>
          <code className="info-value">{walletAddress}</code>
        </div>
      </div>
    </div>
  );
}

export default CircuitCall;
