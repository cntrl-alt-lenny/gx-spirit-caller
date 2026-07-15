; func_02084278 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0210210c
        .global func_02084278
        .arm
func_02084278:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r5, [r4, #0x8]
    ands r0, r5, #0x200
    bne .L_6c
    ldr r2, [r4]
    ands r0, r5, #0x1
    ldrb r3, [r2, #0x1]
    bne .L_38
    ands r0, r5, #0x8
    beq .L_38
    ldrb r0, [r4, #0xad]
    cmp r3, r0
    beq .L_6c
.L_38:
    ldr r6, [r4, #0xd8]
    ldr ip, _LIT0
    ldrh r2, [r6, #0xa]
    add r5, r6, #0x4
    mov r0, r4
    ldrh lr, [r5, r2]
    add r2, r5, r2
    mla r2, lr, r3, r2
    ldr r2, [r2, #0x4]
    ldrh lr, [r6, r2]
    add r2, r6, r2
    ldr ip, [ip, lr, lsl #0x2]
    blx ip
.L_6c:
    ldr r0, [r4]
    add r0, r0, #0x2
    str r0, [r4]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0210210c+0x4
