# Decentralized Transportation Autonomous Vehicle Coordination

A decentralized system for coordinating autonomous vehicles using Clarity smart contracts on the Stacks blockchain.

## Overview

This project implements a set of smart contracts that enable secure, transparent, and efficient coordination of autonomous vehicles in a decentralized transportation network. The system handles vehicle verification, traffic coordination, route optimization, safety monitoring, and insurance integration.

## Smart Contracts

### 1. Vehicle Manufacturer Verification Contract

This contract validates and verifies autonomous vehicle manufacturers, ensuring that only vehicles from trusted manufacturers can participate in the network.

**Key Features:**
- Manufacturer verification and registration
- Vehicle registration by verified manufacturers
- Verification status checks for both manufacturers and vehicles

### 2. Traffic Coordination Contract

This contract manages traffic flow by coordinating autonomous vehicles across different zones and intersections.

**Key Features:**
- Traffic zone registration and management
- Vehicle entry and exit tracking
- Emergency vehicle prioritization
- Zone capacity monitoring

### 3. Route Optimization Contract

This contract calculates and provides optimal routes for autonomous vehicles based on current traffic conditions.

**Key Features:**
- Route segment registration
- Congestion level tracking and updates
- Optimal route calculation
- Vehicle route tracking

### 4. Safety Monitoring Contract

This contract monitors and records safety incidents involving autonomous vehicles and issues safety alerts.

**Key Features:**
- Safety incident reporting and resolution
- Vehicle safety score tracking
- Safety alert issuance and management
- Zone-specific safety monitoring

### 5. Insurance Integration Contract

This contract integrates with insurance providers to handle policies and claims for autonomous vehicles.

**Key Features:**
- Insurance policy registration
- Claim filing and processing
- Premium calculation based on safety scores
- Policy status tracking

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - A Clarity development tool
- [Stacks CLI](https://docs.stacks.co/references/stacks-cli) - Command line interface for the Stacks blockchain
