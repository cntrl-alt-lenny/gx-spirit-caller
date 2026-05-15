/* func_02019a98: set bit `arg` in data_02104e6c[0xa68] — bit-array set
 * on a distinct global (NOT the GetSystemWork state struct).
 *
 * Struct typedef pins base+offset addressing (mwcc otherwise folds
 * `data + 0xa68` into the pool).
 */

extern char *GetSystemWork(void);

typedef struct {
    char _pad_000[0xa68];
    int  flags;                 /* +0xa68 — bit-array flags */
} data_02104f4c_t;

extern data_02104f4c_t data_02104e6c;

void func_02019a98(int bit) {
    (void)GetSystemWork();
    data_02104e6c.flags |= (1 << bit);
}
