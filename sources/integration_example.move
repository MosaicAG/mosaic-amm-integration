module example::integration_example {
    use std::signer;
    use aptos_framework::coin;
    use aptos_framework::fungible_asset::{FungibleAsset, Metadata};
    use aptos_framework::object::Object;
    use aptos_framework::primary_fungible_store;

    /// This example function demonstrates
    /// how to performs a simple swap operation from coin `X` to coin `Y` in Mosaic AMM.
    /// 
    /// # Type Parameters
    /// 
    /// * `X` - The type of the input coin.
    /// * `Y` - The type of the output coin.
    ///
    /// # Parameters
    ///
    /// * `sender` - The signer of the transaction.
    /// * `amount_in` - The amount of input coin `X` to swap.
    /// * `min_amount_out` - The minimum amount of output coin `Y` to receive.
    /// * `is_stable_pool` - A boolean indicating whether to use a stable pool.
    ///
    public entry fun example_swap_exact_coin_for_coin<X, Y>(
        sender: &signer,
        amount_in: u64,
        min_amount_out: u64,
        is_stable_pool: bool,
    ) {
        // Step 1. Get desired liquidity pool for coins `X` and `Y`.
        let pool = mosaic_amm::router::get_pool_both_coins<X, Y>(is_stable_pool);

        // Step 2. Withdraw input coin `X` from the sender.
        let input_coin = coin::withdraw<X>(sender, amount_in);

        // Step 3. Call the `swap_exact_coin_for_coin` function in the `router` module to swap coins.
        let output_coin = mosaic_amm::router::swap_exact_coin_for_coin<X, Y>(
            pool,
            input_coin,
            min_amount_out,
        );

        // Step 4. Deposit output coin `Y` to the sender.
        coin::deposit<Y>(signer::address_of(sender), output_coin);
    }

    /// This example function demonstrates
    /// how to performs a simple swap operation from fungible asset `FA_X` to fungible asset `FA_Y` in Mosaic AMM.
    ///
    /// # Parameters
    ///
    /// * `sender` - The signer of the transaction.
    /// * `input_fa_metadata` - The metadata of the input fungible asset `FA_X`.
    /// * `output_fa_metadata` - The metadata of the output fungible asset `FA_Y`.
    /// * `amount_in` - The amount of input fungible asset `FA_X` to swap.
    /// * `min_amount_out` - The minimum amount of output fungible asset `FA_Y` to receive.
    /// * `is_stable_pool` - A boolean indicating whether to use a stable pool.
    ///
    public entry fun example_swap_exact_fa_for_fa(
        sender: &signer,
        input_fa_metadata: Object<Metadata>,
        output_fa_metadata: Object<Metadata>,
        amount_in: u64,
        min_amount_out: u64,
        is_stable_pool: bool,
    ) {
        // Step 1. Get desired liquidity pool for the given FA in and FA out.
        let pool = mosaic_amm::router::get_pool_both_assets(input_fa_metadata, output_fa_metadata, is_stable_pool);

        // Step 2. Withdraw input FA from the sender.
        let input_fa = primary_fungible_store::withdraw(sender, input_fa_metadata, amount_in);

        // Step 3. Call the `swap_exact_asset_for_asset` function in the `router` module to swap FAs.
        let output_fa = mosaic_amm::router::swap_exact_asset_for_asset(
            pool,
            input_fa,
            output_fa_metadata,
            min_amount_out,
        );

        // Step 4. Deposit output FA to the sender.
        primary_fungible_store::deposit(signer::address_of(sender), output_fa);
    }

    /// This example function demonstrates
    /// how to performs a simple swap operation from coin `X` to fungible asset `FA_Y` in Mosaic AMM.
    /// 
    /// # Type Parameters
    /// 
    /// * `X` - The type of the input coin.
    ///
    /// # Parameters
    ///
    /// * `sender` - The signer of the transaction.
    /// * `output_fa_metadata` - The metadata of the output fungible asset `FA_Y`.
    /// * `amount_in` - The amount of input coin `X` to swap.
    /// * `min_amount_out` - The minimum amount of output fungible asset `FA_Y` to receive.
    /// * `is_stable_pool` - A boolean indicating whether to use a stable pool.
    ///
    public entry fun example_swap_exact_coin_for_fa<X>(
        sender: &signer,
        output_fa_metadata: Object<Metadata>,
        amount_in: u64,
        min_amount_out: u64,
        is_stable_pool: bool,
    ) {
        // Step 1. Get desired liquidity pool for the given coin in and FA out.
        let pool = mosaic_amm::router::get_pool_one_coin<X>(output_fa_metadata, is_stable_pool);

        // Step 2. Withdraw input coin `X` from the sender.
        let input_coin = coin::withdraw<X>(sender, amount_in);

        // Step 3. Call the `swap_exact_coin_for_asset` function in the `router` module to swap coin to FA.
        let output_fa: FungibleAsset = mosaic_amm::router::swap_exact_coin_for_asset<X>(
            pool,
            input_coin,
            output_fa_metadata,
            min_amount_out,
        );

        // Step 4. Deposit output FA to the sender.
        primary_fungible_store::deposit(signer::address_of(sender), output_fa);
    }

    /// This example function demonstrates
    /// how to performs a simple swap operation from fungible asset `FA_X` to coin `Y` in Mosaic AMM.
    /// 
    /// # Type Parameters
    /// 
    /// * `Y` - The type of the output coin.
    ///
    /// # Parameters
    ///
    /// * `sender` - The signer of the transaction.
    /// * `input_fa_metadata` - The metadata of the input fungible asset `FA_X`.
    /// * `amount_in` - The amount of input fungible asset `FA_X` to swap.
    /// * `min_amount_out` - The minimum amount of output coin `Y` to receive.
    /// * `is_stable_pool` - A boolean indicating whether to use a stable pool.
    ///
    public entry fun example_swap_exact_fa_for_coin<Y>(
        sender: &signer,
        input_fa_metadata: Object<Metadata>,
        amount_in: u64,
        min_amount_out: u64,
        is_stable_pool: bool,
    ) {
        // Step 1. Get desired liquidity pool for the given FA in and coin out.
        let pool = mosaic_amm::router::get_pool_one_coin<Y>(input_fa_metadata, is_stable_pool);

        // Step 2. Withdraw input FA from the sender.
        let input_fa = primary_fungible_store::withdraw(sender, input_fa_metadata, amount_in);

        // Step 3. Call the `swap_exact_asset_for_coin` function in the `router` module to swap FA to coin.
        let output_coin = mosaic_amm::router::swap_exact_asset_for_coin<Y>(
            pool,
            input_fa,
            min_amount_out,
        );

        // Step 4. Deposit output coin `Y` to the sender.
        coin::deposit<Y>(signer::address_of(sender), output_coin);
    }
}
