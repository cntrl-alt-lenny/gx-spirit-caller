; func_ov002_022575c8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf1ac
        .extern func_ov002_02257464
        .global func_ov002_022575c8
        .arm
func_ov002_022575c8:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_ov002_02257464
    movs r1, r0
    ldrne r0, [r1, #0x8]
    cmpne r0, #0x0
    beq .L_70
    ldr r0, _LIT0
    mov r2, #0x14
    mul ip, r4, r2
    ldr r3, _LIT1
    and lr, r5, #0x1
    mla r3, lr, r0, r3
    ldr r2, _LIT2
    mov r0, #0x0
    str r0, [r2, #0x5c0]
    ldr r2, [ip, r3]
    mov r2, r2, lsr #0x2
    tst r2, #0x1
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r3, [r1, #0x8]
    mov r0, r6
    mov r1, r5
    mov r2, r4
    blx r3
    ldmia sp!, {r4, r5, r6, pc}
.L_70:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022ce288
