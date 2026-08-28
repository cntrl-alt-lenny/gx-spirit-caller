typedef struct {
    unsigned int   head;
    unsigned int   tail;
    unsigned int   size;
    unsigned char *buf;
} ring_t;

extern int func_020322fc(void);
extern void *func_020323f8(ring_t *r, unsigned short *out_len);
extern void func_0203246c(ring_t *r);
extern void func_02094688(void *src, void *dst, int n);

int func_020348f8(int arg0, char *arg1) {
    unsigned short outLen;

    for (;;) {
        unsigned char *entry = (unsigned char *)func_020323f8((ring_t *)func_020322fc(), &outLen);

        if (entry != 0) {
            unsigned short id = *(unsigned short *)entry & 0x7ff;
            if (id != arg0) {
                return 0;
            }

            func_02094688(entry + 8, arg1 + *(unsigned short *)(entry + 2), *(unsigned short *)(entry + 4));

            if (entry[6] & 2) {
                func_0203246c((ring_t *)func_020322fc());
                return *(unsigned short *)(entry + 2) + *(unsigned short *)(entry + 4);
            }

            func_0203246c((ring_t *)func_020322fc());
        } else {
            return 0;
        }
    }
}
