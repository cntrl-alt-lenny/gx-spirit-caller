/* func_02077ea4: Family G memset + MD5 seed init. */
extern void func_02094500(void *ptr, int val, unsigned count);
void func_02077ea4(unsigned int *self) {
    func_02094500(self, 0, 88);
    self[0] = 0x67452301;
    self[1] = 0xefcdab89;
    self[2] = 0x98badcfe;
    self[3] = 0x10325476;
}
