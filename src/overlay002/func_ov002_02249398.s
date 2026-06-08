; func_ov002_02249398 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_02253458
        .global func_ov002_02249398
        .arm
func_ov002_02249398:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    rsb r6, r0, #0x1
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r6, #0x1
    mla r7, r1, r0, r2
    mov r5, #0x0
    mov r4, #0xd
    b .L_208
.L_1f4:
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_02253458
    add r5, r5, #0x1
.L_208:
    ldr r0, [r7, #0x10]
    cmp r5, r0
    ldmcsia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r5, #0x5
    blt .L_1f4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
