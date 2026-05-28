/* func_02088e6c: stmfd-only + 2-field global check + helper.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r0, [pool]; ldr r1, [r0, #0]
 *     cmp r1, #0; addeq sp; ldmeqia    ; if data.f0 == 0 return
 *     ldr r0, [r0, #4]
 *     cmp r0, #2; addne sp; ldmneia    ; if data.f4 != 2 return
 *     bl func_02088874
 *     pop
 */
struct F02088e6c {
    void *f0;
    int f4;
};

extern struct F02088e6c data_021a524c;
extern void func_02088874(void);

void func_02088e6c(void) {
    if (data_021a524c.f0 == 0) return;
    if (data_021a524c.f4 != 2) return;
    func_02088874();
}
