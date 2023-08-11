Shared Libraries
================

## pivotalcoinconsensus

The purpose of this library is to make the verification functionality that is critical to Pivotalcoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `pivotalcoinconsensus.h` located in  `src/script/pivotalcoinconsensus.h`.

#### Version

`pivotalcoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`pivotalcoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `pivotalcoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/pivotalcoin/bips/blob/master/bip-0016.mediawiki)) subscripts
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/pivotalcoin/bips/blob/master/bip-0066.mediawiki)) compliance
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/pivotalcoin/bips/blob/master/bip-0147.mediawiki))
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/pivotalcoin/bips/blob/master/bip-0065.mediawiki))
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/pivotalcoin/bips/blob/master/bip-0112.mediawiki))
- `pivotalcoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/pivotalcoin/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `pivotalcoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `pivotalcoinconsensus_verify_script` for the verification status)*
- `pivotalcoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `pivotalcoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `pivotalcoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `pivotalcoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NPivotalcoin](https://github.com/NicolasDorier/NPivotalcoin/blob/master/NPivotalcoin/Script.cs#L814) (.NET Bindings)
- [node-libpivotalcoinconsensus](https://github.com/bitpay/node-libpivotalcoinconsensus) (Node.js Bindings)
- [java-libpivotalcoinconsensus](https://github.com/dexX7/java-libpivotalcoinconsensus) (Java Bindings)
- [pivotalcoinconsensus-php](https://github.com/Bit-Wasp/pivotalcoinconsensus-php) (PHP Bindings)
