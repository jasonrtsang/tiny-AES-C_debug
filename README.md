# tiny-AES-C_debug
Deviation from kokke/tiny-AES-c. Used in [zedboard_aes](https://github.com/jasonrtsang/zedboard_aes) for validation

- Change Makefile to run test.c on UNIX console
- Removes c++ support
- Removes 192/256-bit key support
- Removes CTR support
- Add verbose option to print matrix at every state of encryption/ decryption processes