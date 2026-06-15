; func_ov008_021b1f28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b270c
        .extern func_02001e5c
        .extern func_02005088
        .extern func_0208de94
        .extern func_ov008_021b1d08
        .global func_ov008_021b1f28
        .arm
func_ov008_021b1f28:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0x24]
    add r1, r1, #0x1
    str r1, [r2, #0x24]
    ldr r2, [r0]
    ldr r1, [r2, #0x20]
    add r1, r1, #0x1
    str r1, [r2, #0x20]
    ldr r2, [r0]
    ldr r0, [r2, #0x18]
    ldr r1, [r2, #0x20]
    add r0, r0, #0x60
    cmp r1, r0
    movge r0, #0x0
    strge r0, [r2, #0x20]
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x68]
    cmp r0, #0x0
    beq .L_e4
    bl func_0208de94
    ldr r1, _LIT0
    add r2, r0, #0x4e0
    ldr ip, [r1]
    mov r1, #0xc
    ldr r3, [ip, #0x34]
    add r0, ip, #0x28
    str r3, [sp]
    str r1, [sp, #0x4]
    ldr r1, [ip, #0x50]
    add r2, r2, #0x2000
    mov r3, #0x6
    bl func_02005088
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x28
    bl func_02001e5c
    cmp r0, #0x0
    beq .L_bc
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    str r1, [r0, #0x68]
    b .L_e4
.L_bc:
    ldr r0, _LIT0
    ldr r2, [r0]
    ldr r1, [r2, #0x34]
    cmp r1, #0x8c
    bls .L_e4
    mov r1, #0x1
    str r1, [r2, #0x5c]
    ldr r0, [r0]
    mov r1, #0x0
    str r1, [r0, #0x68]
.L_e4:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x5c]
    bl func_ov008_021b1d08
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b270c
