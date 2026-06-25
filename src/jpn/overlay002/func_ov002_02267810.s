; func_ov002_02267810 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b40c4
        .extern func_ov002_021d5b60
        .extern func_ov002_021e2fc4
        .global func_ov002_02267810
        .arm
func_ov002_02267810:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r1, #0xb
    mov r7, r0
    mov r4, r2
    bl func_ov002_021b40c4
    movs r5, r0
    movmi r0, #0x1
    ldmmiia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r2, r4
    mov r3, r5
    mov r1, #0xb
    bl func_ov002_021d5b60
    mov r0, r7, lsl #0x1f
    and r2, r0, #-2147483648
    mov r1, r5, lsl #0x10
    mov r0, r6, lsl #0x10
    orr r3, r2, #0x4400000
    and r2, r0, #0x1f0000
    mov r0, r4, lsl #0x10
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
