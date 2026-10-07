unsigned char func_020b17ac(unsigned long long value) {
 value-= (value>>1)&0x5555555555555555ULL;
 value=(value&0x3333333333333333ULL)+((value>>2)&0x3333333333333333ULL);
 value=(value+(value>>4))&0x0f0f0f0f0f0f0f0fULL;
 value+=value>>8; value+=value>>16;
 return (unsigned char)(value+(value>>32));
}
