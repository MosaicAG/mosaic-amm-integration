module mosaic_amm::router {
    use aptos_framework::coin::Coin;
    use aptos_framework::fungible_asset::{FungibleAsset, Metadata};
    use aptos_framework::object::Object;

    use mosaic_amm::liquidity_pool::LiquidityPool;

    /// Swap exact amount of coin `CoinIn` for coin `CoinOut`.
    ///
    /// # Parameters
    ///
    /// * `_pool` - liquidity pool to swap.
    /// * `_input_coin` - input coin to swap.
    /// * `_coin_out_min_val` - minimum amount of coin out to receive.
    ///
    /// Returns `Coin<Y>`.
    public fun swap_exact_coin_for_coin<CoinIn, CoinOut>(
        _pool: Object<LiquidityPool>,
        _input_coin: Coin<CoinIn>,
        _coin_out_min_val: u64,
    ): Coin<CoinOut> {
        abort 0
    }

    /// Swap exact amount of coin `CoinIn` for fungible asset `FungibleAssetOut`.
    ///
    /// # Parameters
    ///
    /// * `_pool` - liquidity pool to swap.
    /// * `_input_coin` - input coin to swap.
    /// * `_output_fa_metadata` - metadata of the output fungible asset.
    /// * `_amount_out_min_val` - minimum amount of fungible asset out to receive.
    ///
    /// Returns `FungibleAsset` output.
    public fun swap_exact_coin_for_asset<CoinIn>(
        _pool: Object<LiquidityPool>,
        _input_coin: Coin<CoinIn>,
        _output_fa_metadata: Object<Metadata>,
        _amount_out_min_val: u64,
    ): FungibleAsset {
        abort 0
    }

    /// Swap exact amount of fungible asset `FungibleAssetIn` for coin `CoinOut`.
    ///
    /// # Parameters
    ///
    /// * `_pool` - liquidity pool to swap.
    /// * `_input_fa` - input fungible asset to swap.
    /// * `_amount_out_min_val` - minimum amount of coin out to receive.
    ///
    /// Returns `Coin<CoinOut>`.
    public fun swap_exact_asset_for_coin<CoinOut>(
        _pool: Object<LiquidityPool>,
        _input_fa: FungibleAsset,
        _amount_out_min_val: u64,
    ): Coin<CoinOut> {
        abort 0
    }

    /// Swap exact amount of fungible asset `FungibleAssetIn` for fungible asset `FungibleAssetOut`.
    ///
    /// # Parameters
    ///
    /// * `_pool` - liquidity pool to swap.
    /// * `_input_fa` - input fungible asset to swap.
    /// * `_output_fa_metadata` - metadata of the output fungible asset.
    /// * `_amount_out_min_val` - minimum amount of fungible asset out to receive.
    ////
    /// Returns `FungibleAsset` output.
    public fun swap_exact_asset_for_asset(
        _pool: Object<LiquidityPool>,
        _input_fa: FungibleAsset,
        _output_fa_metadata: Object<Metadata>,
        _amount_out_min_val: u64,
    ): FungibleAsset {
        abort 0
    }

    #[view]
    public fun get_pool_both_coins<X, Y>(_is_stable: bool): Object<LiquidityPool> {
        abort 0
    }

    #[view]
    public fun get_pool_one_coin<X>(_token: Object<Metadata>, _is_stable: bool): Object<LiquidityPool> {
        abort 0
    }

    #[view]
    public fun get_pool_both_assets(
        _token_x: Object<Metadata>,
        _token_y: Object<Metadata>,
        _is_stable: bool,
    ): Object<LiquidityPool> {
        abort 0
    }
}