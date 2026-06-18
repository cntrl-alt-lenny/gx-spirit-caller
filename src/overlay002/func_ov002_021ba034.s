; func_ov002_021ba034 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b4120
        .extern func_ov002_021bd85c
        .global func_ov002_021ba034
        .arm
func_ov002_021ba034:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r3, _LIT1
    and ip, r0, #0x1
    mla r3, ip, r2, r3
    mov r2, #0x14
    mla r2, r1, r2, r3
    ldr r2, [r2, #0x30]
    cmp r1, #0x4
    mov r2, r2, lsl #0x13
    mov r4, r2, lsr #0x13
    bgt .L_1d0
    ldr r2, _LIT2
    cmp r4, r2
    bne .L_1d0
    mov r2, r4
    bl func_ov002_021b4120
    mov r4, r0
    mvn r1, #0x0
    cmp r4, r1
    beq .L_1c8
    bl func_ov002_021bd85c
    cmp r0, #0x0
    beq .L_1d0
.L_1c8:
    ldr r0, _LIT2
    ldmia sp!, {r4, pc}
.L_1d0:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001a74
