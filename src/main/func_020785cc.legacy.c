/* func_020785cc: Family G memset + SHA-1 seed init. */
extern void func_020945f4(void *ptr, int val, unsigned count);
void func_020785cc(unsigned int *self) {
    func_020945f4(self, 0, 92);
    self[0] = 0x67452301;
    self[1] = 0xefcdab89;
    self[2] = 0x98badcfe;
    self[3] = 0x10325476;
    self[4] = 0xc3d2e1f0;
}
