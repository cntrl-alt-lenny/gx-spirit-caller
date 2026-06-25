; func_02008f08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .extern func_02008bf4
        .extern func_02008d44
        .extern func_02011b18
        .extern func_02011b34
        .extern func_02011b68
        .extern func_02094500
        .extern func_020aad04
        .global func_02008f08
        .arm
func_02008f08:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl func_02008bf4
    cmp r6, #0x0
    beq .L_1ec
    cmp r6, #0x1
    beq .L_1fc
    b .L_24c
.L_1ec:
    mov r0, r5
    mov r1, r4
    bl func_02008d44
    ldmia sp!, {r4, r5, r6, pc}
.L_1fc:
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x124
    bl func_02094500
    ldr r1, _LIT0
    add r0, r5, #0x1
    ldr r1, [r1, #0x14]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    strb r1, [r4]
    bl func_02011b34
    mov r1, r0
    add r0, r4, #0x1
    bl func_020aad04
    add r0, r5, #0x1
    bl func_02011b18
    mov r1, r0
    add r0, r4, #0x1c
    bl func_02011b68
    ldmia sp!, {r4, r5, r6, pc}
.L_24c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02104e5c
