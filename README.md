# Blockchain-Based Sales Territory Management System

A comprehensive blockchain solution for managing sales territories using Clarity smart contracts on the Stacks blockchain. This system provides transparent, immutable, and decentralized management of sales territories, manager verification, performance tracking, and territory optimization.

## 🏗️ System Architecture

The system consists of five interconnected smart contracts:

### 1. Territory Manager Verification (`territory-manager-verification.clar`)
- **Purpose**: Validates and manages sales territory managers
- **Key Features**:
    - Manager registration and verification
    - Status management (pending, verified, suspended, revoked)
    - Wallet address to manager ID mapping
    - Territory count tracking

### 2. Territory Optimization (`territory-optimization.clar`)
- **Purpose**: Optimizes sales territories based on various metrics
- **Key Features**:
    - Territory creation with population and area data
    - Optimization score calculation
    - Revenue tracking and updates
    - Performance-based territory adjustments

### 3. Coverage Analysis (`coverage-analysis.clar`)
- **Purpose**: Analyzes territory coverage and identifies gaps
- **Key Features**:
    - Coverage percentage calculation
    - Gap area identification
    - Priority-based gap management
    - Coverage status updates

### 4. Performance Measurement (`performance-measurement.clar`)
- **Purpose**: Measures territory and manager performance
- **Key Features**:
    - Territory performance tracking
    - Manager performance aggregation
    - Bonus calculation system
    - Performance ranking

### 5. Realignment Coordination (`realignment-coordination.clar`)
- **Purpose**: Coordinates territory realignments through democratic voting
- **Key Features**:
    - Proposal creation and management
    - Democratic voting system
    - Proposal finalization
    - Implementation tracking

## 🚀 Getting Started

### Prerequisites
- Stacks blockchain development environment
- Clarity CLI tools
- Node.js and npm for testing

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd blockchain-territory-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

## 📋 Contract Functions

### Territory Manager Verification

#### Public Functions
- `register-manager(name)` - Register a new territory manager
- `verify-manager(manager-id)` - Verify a pending manager (owner only)
- `update-manager-status(manager-id, status)` - Update manager status (owner only)

#### Read-Only Functions
- `get-manager(manager-id)` - Get manager details by ID
- `get-manager-by-address(wallet-address)` - Get manager by wallet address
- `is-verified-manager(manager-id)` - Check if manager is verified

### Territory Optimization

#### Public Functions
- `create-territory(manager-id, name, population, area-size, revenue-potential)` - Create new territory
- `optimize-territory(territory-id)` - Calculate optimization score
- `update-territory-revenue(territory-id, revenue)` - Update territory revenue

#### Read-Only Functions
- `get-territory(territory-id)` - Get territory details
- `calculate-optimization-score(population, area-size, revenue-potential, current-revenue)` - Calculate optimization score

### Coverage Analysis

#### Public Functions
- `analyze-coverage(territory-id, total-accounts, active-accounts)` - Analyze territory coverage
- `identify-coverage-gap(territory-id, area-name, potential-accounts, priority)` - Identify coverage gaps
- `update-coverage-status(territory-id, active-accounts)` - Update coverage status

#### Read-Only Functions
- `get-coverage-analysis(territory-id)` - Get coverage analysis data
- `get-coverage-gap(gap-id)` - Get coverage gap details
- `calculate-coverage-score(active-accounts, total-accounts)` - Calculate coverage percentage

### Performance Measurement

#### Public Functions
- `record-territory-performance(territory-id, period, revenue, target-revenue, new-accounts, target-accounts)` - Record territory performance
- `record-manager-performance(manager-id, period, total-revenue, total-target, territories-managed)` - Record manager performance
- `update-territory-ranking(territory-id, period, ranking)` - Update territory ranking

#### Read-Only Functions
- `get-territory-performance(territory-id, period)` - Get territory performance data
- `get-manager-performance(manager-id, period)` - Get manager performance data
- `calculate-performance-score(actual, target)` - Calculate performance score

### Realignment Coordination

#### Public Functions
- `create-realignment-proposal(affected-territories, new-boundaries, justification, expected-impact)` - Create realignment proposal
- `vote-on-proposal(proposal-id, vote)` - Vote on proposal
- `finalize-proposal(proposal-id)` - Finalize proposal after voting period
- `implement-realignment(proposal-id)` - Implement approved proposal (owner only)

#### Read-Only Functions
- `get-proposal(proposal-id)` - Get proposal details
- `get-vote(proposal-id, voter)` - Get vote details
- `is-proposal-active(proposal-id)` - Check if proposal is active

## 🧪 Testing

The system includes comprehensive test suites using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific contract tests
npm test territory-manager-verification
npm test territory-optimization
npm test coverage-analysis
npm test performance-measurement
npm test realignment-coordination
\`\`\`

### Test Coverage
- Manager registration and verification flows
- Territory creation and optimization
- Coverage analysis and gap identification
- Performance measurement and ranking
- Democratic proposal and voting system

## 📊 Key Metrics and Calculations

### Optimization Score
\`\`\`
efficiency_score = population / area_size
revenue_score = (current_revenue * 100) / revenue_potential
optimization_score = (efficiency_score + revenue_score) / 2
\`\`\`

### Coverage Percentage
\`\`\`
coverage_percentage = (active_accounts * 100) / total_accounts
gap_areas = coverage_percentage < 80% ? 1 : 0
\`\`\`

### Performance Score
\`\`\`
revenue_score = (actual_revenue * 100) / target_revenue
account_score = (new_accounts * 100) / target_accounts
performance_score = (revenue_score + account_score) / 2
\`\`\`

### Manager Bonus
\`\`\`
average_performance = (total_revenue * 100) / total_target
bonus_earned = average_performance > 100 ? (average_performance - 100) * 10 : 0
\`\`\`

## 🔐 Security Features

- **Access Control**: Owner-only functions for critical operations
- **Input Validation**: Comprehensive parameter validation
- **State Management**: Immutable blockchain state tracking
- **Democratic Governance**: Voting-based territory realignment
- **Audit Trail**: Complete transaction history

## 🌟 Benefits

1. **Transparency**: All territory changes and performance data on blockchain
2. **Immutability**: Tamper-proof record of all transactions
3. **Decentralization**: No single point of failure
4. **Automation**: Smart contract-based calculations and validations
5. **Democratic Process**: Community-driven territory realignment
6. **Performance Tracking**: Comprehensive metrics and analytics

## 🔄 Workflow Example

1. **Manager Registration**: Sales manager registers on the platform
2. **Verification**: Admin verifies and approves the manager
3. **Territory Creation**: Manager creates territories with population/area data
4. **Performance Tracking**: System records sales performance and coverage
5. **Optimization**: Algorithm calculates optimization scores
6. **Realignment Proposal**: Community proposes territory changes
7. **Voting**: Stakeholders vote on proposals
8. **Implementation**: Approved changes are implemented

## 📈 Future Enhancements

- Integration with external data sources (census, economic data)
- Machine learning-based territory optimization
- Mobile application for field managers
- Real-time performance dashboards
- Integration with CRM systems
- Multi-chain deployment support

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Write tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the repository
- Contact the development team
- Check the documentation wiki

---

**Note**: This system is designed for demonstration purposes. For production use, additional security audits and testing are recommended.
\`\`\`

Now let me create the PR details file:
