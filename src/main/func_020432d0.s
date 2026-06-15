; func_020432d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fea58
        .extern data_020feb0c
        .extern data_020feb80
        .extern data_020feb90
        .extern data_0219d9f0
        .extern data_0219d9fc
        .extern func_0204037c
        .extern func_020418ac
        .global func_020432d0
        .arm
func_020432d0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    ldr r0, [r0]
    add r1, r1, #0x1000
    cmp r0, #0x0
    ldr r4, [r1, #0x10c]
    beq .L_10c
    bl func_020418ac
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldr r1, [r1]
    mov r2, #0x0
    blx r4
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0]
.L_10c:
    bl func_0204037c
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r0, r0, #0x1000
    ldr r1, [r0, #0x114]
    cmp r1, #0x0
    beq .L_150
    ldr r0, _LIT3
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x114]
.L_150:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r0, r0, #0x1000
    ldr r1, [r0, #0x118]
    cmp r1, #0x0
    beq .L_188
    ldr r0, _LIT4
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    add r0, r0, #0x1000
    str r1, [r0, #0x118]
.L_188:
    ldr r1, _LIT0
    ldr r0, _LIT5
    ldr r1, [r1]
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9f0
_LIT1: .word data_0219d9fc
_LIT2: .word data_020feb80
_LIT3: .word data_020fea58
_LIT4: .word data_020feb0c
_LIT5: .word data_020feb90
