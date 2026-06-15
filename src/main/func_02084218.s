; func_02084218 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102200
        .global func_02084218
        .arm
func_02084218:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r3, [r4, #0x8]
    ands r2, r3, #0x200
    bne .L_19c0
    ands r2, r3, #0x1
    beq .L_19c0
    ands r2, r3, #0x2
    bne .L_19c0
    ldr r5, [r4, #0xdc]
    ldr r3, [r4]
    ldrh r2, [r5, #0x6]
    ldrb r3, [r3, #0x1]
    ldr ip, _LIT0
    ldrh lr, [r5, r2]
    add r2, r5, r2
    mla r2, lr, r3, r2
    ldr r2, [r2, #0x4]
    ldrh lr, [r5, r2]
    add r2, r5, r2
    ldr ip, [ip, lr, lsl #0x2]
    blx ip
.L_19c0:
    ldr r0, [r4]
    add r0, r0, #0x2
    str r0, [r4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02102200
