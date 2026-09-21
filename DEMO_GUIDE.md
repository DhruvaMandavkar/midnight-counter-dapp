# Demo Video Guide

This guide explains what to show in your demo videos for Level 2 and Level 3 submissions.

---

## Level 2 Demo Video (Under 2 Minutes)

### Recording Setup
- **Tool**: Loom, OBS Studio, or screen recording software
- **Duration**: 1:30 - 2:00 minutes
- **Resolution**: 1080p recommended
- **Audio**: Clear narration explaining each step

### What to Show

#### 1. Wallet Connection (20 seconds)
**Show:**
- Landing page with "Connect Lace Wallet" button
- Click the button
- Lace wallet popup appears
- Accept connection
- Wallet address appears in header

**Narrate:**
"First, I'll connect my Lace wallet to the dApp. The wallet address now appears at the top, confirming we're connected to Preprod testnet."

#### 2. Private Increment (40 seconds)
**Show:**
- Current counter value displayed
- Select increment amount (e.g., 7)
- Keep "Private" mode selected
- Click "Execute Circuit" button
- Loading state: "Generating zero-knowledge proof..."
- Wait for proof generation
- Transaction submits
- Success message appears
- Counter updates (e.g., 42 → 49)

**Narrate:**
"I'll increment the counter by 7 using private mode. Watch as the dApp generates a zero-knowledge proof locally. This proves my increment is valid without revealing the amount. The counter increased, but my contribution stays private."

#### 3. Public Increment (30 seconds)
**Show:**
- Select different amount (e.g., 3)
- Switch to "Public" mode
- Notice the privacy explanation changes
- Click "Execute Circuit"
- Proof generates
- Success with disclosed amount shown
- Counter updates again

**Narrate:**
"Now I'll try public mode. This time, my increment amount will be visible on-chain. The user controls their privacy level."

#### 4. Privacy Demonstration (20 seconds)
**Show:**
- Scroll to contract info section
- Point out contract address
- Highlight that individual increments aren't visible
- Mention ZK proof verification

**Narrate:**
"The key feature: observers see the counter changed by 10 total, but can't tell it was 7+3 unless I chose public disclosure. This is zero-knowledge in action."

#### 5. Closing (10 seconds)
**Show:**
- Quick scroll through the UI
- Wallet still connected
- Final counter value

**Narrate:**
"This demonstrates privacy-preserving smart contracts on Midnight Network, where users control what they reveal."

---

## Level 3 Demo Video (1 Minute)

### Recording Setup
- **Tool**: Screen recording + terminal
- **Duration**: 45 - 60 seconds
- **Split screen**: Code editor + terminal + browser

### What to Show

#### 1. Full dApp Flow (20 seconds)
**Show:**
- Quick wallet connection
- Fast increment operation
- Result displayed
- No detailed explanation (already done in Level 2)

**Narrate:**
"Here's the production dApp in action - wallet connects, circuit executes with proof generation, and results appear instantly."

#### 2. Test Suite (20 seconds)
**Show:**
- Terminal running `npm test`
- Watch tests execute in real-time
- All 15+ tests passing
- Green checkmarks
- Coverage summary

**Narrate:**
"The test suite covers circuit logic, state transitions, privacy preservation, and constraints. All 15 tests pass, ensuring production readiness."

#### 3. CI Pipeline (15 seconds)
**Show:**
- Open README in browser
- Scroll to CI badge
- Click badge to show GitHub Actions
- Pipeline steps passing
- Build artifacts created

**Narrate:**
"Our CI/CD pipeline automatically builds, tests, and validates every push. The green badge confirms everything works."

#### 4. Production Features (5 seconds)
**Show:**
- Quick demo of error handling
- Mobile responsive view
- Loading states

**Narrate:**
"Production polish: error handling, mobile responsive, and professional UX throughout."

---

## Recording Tips

### DO:
✅ Use a quiet environment  
✅ Speak clearly and at normal pace  
✅ Show actual proof generation time (don't speed up)  
✅ Point out key privacy features  
✅ Keep under time limit  
✅ Show real wallet connection  
✅ Demonstrate both private and public modes  

### DON'T:
❌ Skip the proof generation step  
❌ Speed up video (shows proof time is important)  
❌ Have background noise  
❌ Rush through explanations  
❌ Forget to show test results  
❌ Skip the CI badge demonstration  

---

## Checklist Before Recording

### Level 2:
- [ ] Lace wallet installed and funded
- [ ] Contract deployed to Preprod
- [ ] Frontend deployed to Vercel
- [ ] .env configured with contract address
- [ ] Test the full flow yourself first
- [ ] Script written (optional but recommended)

### Level 3:
- [ ] All tests passing locally
- [ ] CI pipeline green on GitHub
- [ ] README has CI badge
- [ ] PROPOSAL.md complete
- [ ] Error handling works
- [ ] Mobile responsive tested

---

## Video Hosting

**Recommended platforms:**
1. **YouTube** (unlisted) - Free, reliable
2. **Loom** - Easy screen recording + hosting
3. **Vimeo** - Professional option
4. **Google Drive** - Simple sharing

**Link format:**
```
Level 2: https://youtu.be/YOUR_VIDEO_ID
Level 3: https://youtu.be/YOUR_VIDEO_ID
```

Add these links to:
- README.md (Demo Video section)
- Rise In submission form
- GitHub repository description

---

## Example Script (Level 2)

```
[0:00] "Hi, I'm demonstrating a privacy-preserving counter on Midnight Network."

[0:05] "First, I'll connect my Lace wallet..." [Click connect] "...and we're connected to Preprod testnet."

[0:15] "The counter currently shows 42. I'll increment it by 7 using private mode."

[0:25] "Clicking Execute Circuit... the dApp is now generating a zero-knowledge proof locally."

[0:35] "This takes about 10 seconds. The proof verifies my increment is between 0 and 10..."

[0:45] "...without revealing the actual value. Success! The counter is now 49."

[0:55] "Now let's try public mode with increment of 3..."

[1:05] "This time, the amount is disclosed. The counter updates to 52."

[1:15] "The key insight: observers see the total increased by 10, but can't determine..."

[1:25] "...it was 7+3 unless I chose public disclosure. This is zero-knowledge privacy in action."

[1:35] "Privacy-preserving dApps on Midnight Network. Thank you."
```

---

## Post-Recording

After recording:
1. ✅ Watch the video yourself
2. ✅ Check audio quality
3. ✅ Verify all key points shown
4. ✅ Confirm timing (under limits)
5. ✅ Upload to platform
6. ✅ Set visibility (public or unlisted)
7. ✅ Copy link
8. ✅ Update README.md
9. ✅ Add to submission form

---

## Need Help?

**Common Issues:**

**Issue**: Proof generation too slow
**Fix**: This is normal (10-30 seconds). Don't skip showing it - it demonstrates real ZK computation.

**Issue**: Wallet won't connect
**Fix**: Ensure Lace is on Preprod network. Check browser console for errors.

**Issue**: Tests failing
**Fix**: Run `npm test` before recording. Fix issues first.

**Issue**: Video too long
**Fix**: Cut unnecessary parts. Focus on key features. Practice first.

---

Good luck with your demo videos! 🎥🚀
