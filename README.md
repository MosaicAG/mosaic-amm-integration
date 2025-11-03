# Mosaic AMM Smart Contract integration

This repo contains an example contract for integrating with Mosaic AMM smart contract.

## Integrate with Mosaic AMM smart contract

There are 3 steps to integrate with the Mosaic AMM smart contract:

1. Copy the interface directory (`interface/mosaic_amm` directory) to your project.
2. Add the `mosaic_amm` interface to your project's configuration file (`Move.toml`).

The code below shows how to add the `mosaic_amm` interface to your project's configuration file (`Move.toml`). 
You could change to the location of the `mosaic_amm` interface directory if it is different from the example below.

```toml
[dependencies.MosaicAMM]
local = "./interface/mosaic_amm"
```

3. Import module and use the methods provided to perform token swaps, supporting both coin and fungible asset (FA) standards. Please refer to the [`integration_example` module](./sources/integration_example.move) for more details.

**Note**: Please use the appropriate contract addresses for the Mosaic AMM smart contract based on the network you are deploying to by updating the value of the `mosaic_amm` address in the `mosaic_amm/Move.toml` file.

## Contract addresses

- **Mainnet**: `0x26a95d4bd7d7fc3debf6469ff94837e03e887088bef3a3f2d08d1131141830d3`