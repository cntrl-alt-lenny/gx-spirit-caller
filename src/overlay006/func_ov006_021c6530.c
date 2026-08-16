/* func_ov006_021c6530: hit-test (x,y) against the 3-entry
 * data_ov006_021ce084 AABB table (skipping id==2 when the corner button
 * is hidden), then against a self-relative record's scrolling 6-slot
 * grid; report {kind,value} via out and return 1 on any hit.
 *
 *     stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
 *     mov   r7, r3
 *     mov   r5, #0x0
 *     str   r5, [r7]
 *     str   r5, [r7, #0x4]
 *     ldr   r6, .L_LIT0          ; data_ov006_021ce084
 *     ldr   r4, .L_LIT1          ; data_ov006_0225deb4
 *     ...
 *     ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
 */

typedef struct {
    short xMin, yMin, xMax, yMax;
    int id;
} Ov006HitRect021ce084;

extern Ov006HitRect021ce084 data_ov006_021ce084[3];

typedef struct {
    char _pad[0x3c];
    int f_3c;
    int f_40;
} state_3c_40_t;

extern int func_ov006_021c6f24(state_3c_40_t *p);
extern state_3c_40_t data_ov006_0225deb4;

int func_ov006_021c6530(char *self, int x, int y, char *out) {
    int i;
    Ov006HitRect021ce084 *row;
    int t1, t2;
    char *row2;
    int j;

    *(int *)(out + 0) = 0;
    *(int *)(out + 4) = 0;
    *(int *)(out + 8) = 0;

    row = data_ov006_021ce084;
    for (i = 0; i < 3; i++, row++) {
        if (func_ov006_021c6f24(&data_ov006_0225deb4) == 0) {
            if (row->id == 2) {
                continue;
            }
        }
        if (x >= row->xMin && y >= row->yMin) {
            if (x <= row->xMax && y <= row->yMax) {
                *(int *)(out + 0) = 1;
                *(int *)(out + 4) = row->id;
                return 1;
            }
        }
    }

    row2 = (self + 0x6c) + *(int *)(self + 0x4c) * 0x10;
    j = 0;
    t1 = 0x21;
    t2 = 0x31;
    for (; j < 6; j++, t1 += 0x16, t2 += 0x16) {
        int v = *(volatile int *)(row2 + 4) + j;
        if (v < 0) continue;
        if (v >= *(int *)(row2 + 8)) continue;
        if (x >= 0xc && y >= t1 && x < 0xde && y < t2) {
            *(int *)(out + 0) = 2;
            *(int *)(out + 4) = j;
            return 1;
        }
    }

    *(int *)(out + 0) = 0;
    return 0;
}
