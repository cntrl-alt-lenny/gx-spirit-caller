/* func_ov015_021b3528: configure a text printer — push the per-index palette
 * word, open the printer onto its window, then stamp the active-channel glyph
 * code (low 3 bits of the global mode word index a signed code table). (ov015) */
extern void func_020a6afc(void *, int);
extern char *func_020a6a28(void *, void *);
extern char data_ov015_021b5cbc[];
extern char data_ov015_021b5d30[];
extern char data_ov015_021b5b0c[];
extern struct { int w0; unsigned chan : 3; } data_02104f4c;
void func_ov015_021b3528(void *o, int idx) {
    char *p;
    func_020a6afc(o, ((int *)data_ov015_021b5cbc)[idx]);
    p = func_020a6a28(o, data_ov015_021b5d30);
    *p = ((signed char *)data_ov015_021b5b0c)[data_02104f4c.chan];
}
