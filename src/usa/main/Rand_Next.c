/* Rand_Next: C23-noMMIO MSVC LCG rand -> state=state*0x343fd+0x269ec3; (state>>16)&0x7fff. */
extern char data_02197354[];
int Rand_Next(void) {
    unsigned int s = *(unsigned int *)(data_02197354 + 4);
    s = s * 0x343fd + 0x269ec3;
    *(unsigned int *)(data_02197354 + 4) = s;
    return (s >> 16) & 0x7fff;
}
