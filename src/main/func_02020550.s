; func_02020550 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_020205ec
        .extern func_020206b8
        .extern func_0209e4f8
        .global func_02020550
        .arm
func_02020550:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0209e4f8
    cmp r0, #0x8000
    bne .L_ec
    mov r0, #0x3
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    mov r0, #0x3
    ldmia sp!, {r4, pc}
.L_ec:
    cmp r0, #0x0
    bne .L_10c
    mov r0, #0x16
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    mov r0, #0x18
    ldmia sp!, {r4, pc}
.L_10c:
    sub r1, r4, #0x1
    mov r2, #0x1
    tst r0, r2, lsl r1
    bne .L_140
.L_11c:
    add r1, r4, #0x1
    mov r1, r1, lsl #0x10
    mov r4, r1, lsr #0x10
    cmp r4, #0x10
    movhi r0, #0x18
    ldmhiia sp!, {r4, pc}
    sub r1, r4, #0x1
    tst r0, r2, lsl r1
    beq .L_11c
.L_140:
    ldr r0, _LIT0
    mov r1, r4
    bl func_020206b8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word func_020205ec
