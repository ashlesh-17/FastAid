# FastAid
A Salesforce-powered solution designed to streamline administrative and development workflows, helping teams work more efficiently.

## 🚀 About FastAid
FastAid is a Salesforce application that leverages the power of Agentforce Agents and Einstein AI to provide intelligent assistance and automation for administrators and developers. By utilizing Prompt Templates and Topics, it delivers context-aware responses and actions to help users work more efficiently within their Salesforce org.

## ⚠️ Disclaimer
This project was developed during a 3-day hackathon. While we've strived for quality and functionality, you might encounter some rough edges or areas that could be improved. We welcome constructive feedback and suggestions for enhancement. Please be kind in your reviews! 😊

## 🛠️ Technical Stack
- Salesforce Agentforce Agents
- Einstein AI Integration
- Prompt Templates
- Topics and Actions
- Custom Labels and Settings
- Salesforce Platform

## 📋 Pre-Deployment Steps

1. **Enable Einstein AI**
   - Navigate to Setup
   - Search for "Einstein Setup"
   - Turn on Einstein AI

2. **Configure Agentforce**
   - Navigate to Setup
   - Search for "Agentforce Agents"
   - Turn on Agentforce
   - Enable the "Agentforce (Default) Agent"

3. **Update Session ID**
   - Navigate to Setup
   - Search for "Custom Labels"
   - Update the "SessionId" label with your session ID

## 🚀 Deployment Steps

- Deploy the package.xml to your org.

## 🔧 Development Setup
1. Clone the repository
2. Install dependencies: `npm install`
3. Run tests: `npm test`
4. Format code: `npm run prettier`

## 📝 License
This project is licensed under the terms specified in the LICENSE file.