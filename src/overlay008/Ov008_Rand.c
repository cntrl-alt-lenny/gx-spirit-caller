/* Ov008_Rand: C23-noMMIO MSVC LCG rand -> state=state*0x343fd+0x269ec3; (state>>16)&0x7fff. */
extern char data_ov008_021b2780[];
int Ov008_Rand(void) {
    unsigned int s = *(unsigned int *)(data_ov008_021b2780 + 8);
    s = s * 0x343fd + 0x269ec3;
    *(unsigned int *)(data_ov008_021b2780 + 8) = s;
    return (s >> 16) & 0x7fff;
}
