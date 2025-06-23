# Blockchain-Based Supply Chain Supplier Risk Management

A comprehensive smart contract system for managing supplier risks in blockchain-based supply chains. This system provides end-to-end risk management capabilities including verification, assessment, monitoring, mitigation planning, and recovery management.

## 🏗️ System Architecture

The system consists of five interconnected smart contracts:

### 1. Risk Manager Verification Contract (`risk-manager-verification.clar`)
- **Purpose**: Validates and manages supply chain risk managers
- **Key Features**:
    - Manager verification requests and approvals
    - Credential validation
    - Status management (active/revoked)
    - Authorization controls

### 2. Risk Assessment Contract (`risk-assessment.clar`)
- **Purpose**: Assesses and tracks supplier risks
- **Key Features**:
    - Supplier registration
    - Multi-dimensional risk scoring (financial, operational, compliance)
    - Risk level categorization (low/medium/high)
    - Assessment history tracking

### 3. Monitoring Coordination Contract (`monitoring-coordination.clar`)
- **Purpose**: Coordinates continuous risk monitoring
- **Key Features**:
    - Monitoring schedule management
    - Alert system with severity levels
    - Automated monitoring reports
    - Due date tracking

### 4. Mitigation Planning Contract (`mitigation-planning.clar`)
- **Purpose**: Plans and manages risk mitigation strategies
- **Key Features**:
    - Mitigation plan creation and management
    - Action item tracking with deadlines
    - Plan approval workflow
    - Priority-based planning

### 5. Recovery Management Contract (`recovery-management.clar`)
- **Purpose**: Manages incident response and business continuity
- **Key Features**:
    - Recovery plan templates
    - Incident reporting and tracking
    - Recovery action management
    - Performance metrics and lessons learned

## 🚀 Getting Started

### Prerequisites
- Clarinet CLI installed
- Stacks blockchain development environment
- Basic understanding of Clarity smart contracts

### Installation

1. Clone the repository:
   \`\`\`bash
   git clone <repository-url>
   cd supply-chain-risk-management
   \`\`\`

2. Install dependencies:
   \`\`\`bash
   clarinet install
   \`\`\`

3. Run tests:
   \`\`\`bash
   npm test
   \`\`\`

### Deployment

1. Deploy contracts to testnet:
   \`\`\`bash
   clarinet deploy --testnet
   \`\`\`

2. Verify deployment:
   \`\`\`bash
   clarinet console
   \`\`\`

## 📋 Usage Examples

### 1. Manager Verification
\`\`\`clarity
;; Request verification as a risk manager
(contract-call? .risk-manager-verification request-verification "Certified Risk Manager, 5 years experience")

;; Verify a manager (contract owner only)
(contract-call? .risk-manager-verification verify-manager 'SP1234... "Certified Risk Manager")
\`\`\`

### 2. Supplier Risk Assessment
\`\`\`clarity
;; Register a new supplier
(contract-call? .risk-assessment register-supplier 'SP5678... "Acme Corp" "Manufacturing")

;; Assess supplier risk
(contract-call? .risk-assessment assess-supplier-risk 'SP5678... u25 u40 u30 "Good financial standing, moderate operational risk")
\`\`\`

### 3. Monitoring Setup
\`\`\`clarity
;; Setup monitoring for a supplier
(contract-call? .monitoring-coordination setup-monitoring 'SP5678... u144 u70)

;; Create an alert
(contract-call? .monitoring-coordination create-alert 'SP5678... "Financial" "high" "Credit rating downgrade detected")
\`\`\`

### 4. Mitigation Planning
\`\`\`clarity
;; Create a mitigation plan
(contract-call? .mitigation-planning create-mitigation-plan
'SP5678...
"Financial Risk"
"high"
"Address supplier financial instability"
"1. Diversify suppliers 2. Increase monitoring 3. Negotiate payment terms"
u30
u50000)
\`\`\`

### 5. Recovery Management
\`\`\`clarity
;; Report an incident
(contract-call? .recovery-management report-incident
'SP5678...
"Supply Disruption"
"critical"
"Factory shutdown due to equipment failure"
"Production delayed by 2 weeks, affects 3 major clients")

;; Activate recovery plan
(contract-call? .recovery-management activate-recovery-plan u1 u1)
\`\`\`

## 🔧 Contract Functions

### Risk Manager Verification
- `request-verification(credentials)` - Request manager verification
- `verify-manager(manager, credentials)` - Verify a risk manager
- `revoke-verification(manager)` - Revoke manager verification
- `is-verified-manager(manager)` - Check if manager is verified

### Risk Assessment
- `register-supplier(supplier, name, category)` - Register new supplier
- `assess-supplier-risk(supplier, financial, operational, compliance, notes)` - Assess risks
- `get-supplier-risk-level(supplier, assessor)` - Get risk level classification

### Monitoring Coordination
- `setup-monitoring(supplier, frequency, threshold)` - Setup monitoring schedule
- `create-alert(supplier, type, severity, message)` - Create risk alert
- `submit-monitoring-report(supplier, score, findings, recommendations)` - Submit report

### Mitigation Planning
- `create-mitigation-plan(supplier, risk-type, priority, description, actions, timeline, budget)` - Create plan
- `add-plan-action(plan-id, description, responsible-party, deadline)` - Add action item
- `approve-plan(plan-id, comments)` - Approve mitigation plan

### Recovery Management
- `create-recovery-plan(supplier, incident-type, severity, description, steps, duration, resources)` - Create recovery plan
- `report-incident(supplier, type, severity, description, impact)` - Report incident
- `activate-recovery-plan(incident-id, plan-id)` - Activate recovery process

## 🧪 Testing

The system includes comprehensive tests using Vitest:

\`\`\`bash
# Run all tests
npm test

# Run specific test file
npm test -- risk-manager-verification.test.js

# Run tests with coverage
npm test -- --coverage
\`\`\`

## 📊 Risk Scoring System

### Risk Categories
- **Financial Risk** (0-100): Credit rating, payment history, financial stability
- **Operational Risk** (0-100): Production capacity, quality control, delivery performance
- **Compliance Risk** (0-100): Regulatory compliance, certifications, audit results

### Overall Risk Levels
- **Low Risk**: 0-30 (Green)
- **Medium Risk**: 31-70 (Yellow)
- **High Risk**: 71-100 (Red)

## 🔒 Security Features

- **Access Control**: Role-based permissions for different functions
- **Data Integrity**: Immutable audit trails for all risk assessments
- **Transparency**: All actions recorded on blockchain
- **Decentralization**: No single point of failure

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🆘 Support

For support and questions:
- Create an issue in the GitHub repository
- Contact the development team
- Check the documentation wiki

## 🗺️ Roadmap

- [ ] Integration with external risk data providers
- [ ] Advanced analytics and reporting dashboard
- [ ] Mobile application for risk managers
- [ ] AI-powered risk prediction models
- [ ] Multi-chain deployment support
  \`\`\`

