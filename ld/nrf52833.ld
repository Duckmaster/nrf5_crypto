SECTIONS
{
    .crypto_data :
    {
      PROVIDE(__start_crypto_data = .);
      KEEP(*(SORT(.crypto_data*)))
      PROVIDE(__stop_crypto_data = .);
    } > FLASH
}
