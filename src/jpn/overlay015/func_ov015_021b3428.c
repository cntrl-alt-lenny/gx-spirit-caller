/* func_ov015_021b3428: configure a text printer — push the per-index palette
 * word, open the printer onto its window, then stamp the active-channel glyph
 * code (low 3 bits of the global mode word index a signed code table). (ov015) */
extern void func_020a6a08(void *, int);
extern char *func_020a6934(void *, void *);
extern char data_ov015_021b5b9c[];
extern char data_ov015_021b5c10[];
extern char data_ov015_021b59f4[];
extern struct { int w0; unsigned chan : 3; } data_02104e6c;
void func_ov015_021b3428(void *o, int idx) {
    char *p;
    func_020a6a08(o, ((int *)data_ov015_021b5b9c)[idx]);
    p = func_020a6934(o, data_ov015_021b5c10);
    *p = ((signed char *)data_ov015_021b59f4)[data_02104e6c.chan];
}
