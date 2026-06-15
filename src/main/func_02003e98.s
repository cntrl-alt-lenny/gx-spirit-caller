; func_02003e98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_020028b8
        .extern func_020038c0
        .extern func_02003d98
        .global func_02003e98
        .arm
func_02003e98:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x10
    mov r7, r0
    mov r6, r2
    mov r5, r3
    cmp r1, #0x80
    ldr r4, [sp, #0x2c]
    bge .L_38
    ldr ip, [sp, #0x28]
    str ip, [sp]
    str r4, [sp, #0x4]
    bl func_02003d98
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_38:
    mov r0, r1
    mov r1, r4
    bl func_020038c0
    ldr r1, _LIT0
    add ip, r4, r4, lsr #0x1f
    ldr r1, [r1, #0x8]
    ldr r2, [sp, #0x28]
    str r1, [sp]
    ldr r3, [r7]
    mov r1, r5
    str r3, [sp, #0x4]
    mov r3, r4
    str r6, [sp, #0x8]
    mov ip, ip, asr #0x1
    str ip, [sp, #0xc]
    bl func_020028b8
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02102c7c
