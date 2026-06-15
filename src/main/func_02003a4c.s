; func_02003a4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02001f18
        .extern func_020037d0
        .extern func_020038c0
        .global func_02003a4c
        .arm
func_02003a4c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    mov r6, r2
    mov r5, r3
    cmp r1, #0x80
    ldr r4, [sp, #0x24]
    bge .L_1c4
    ldr ip, [sp, #0x20]
    str ip, [sp]
    str r4, [sp, #0x4]
    bl func_020037d0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_1c4:
    mov r0, r1
    mov r1, r4
    bl func_020038c0
    ldr r1, [r7]
    add ip, r4, r4, lsr #0x1f
    str r1, [sp]
    ldr r2, [sp, #0x20]
    mov r1, r5
    mov r3, r4
    str r6, [sp, #0x4]
    mov ip, ip, asr #0x1
    str ip, [sp, #0x8]
    bl func_02001f18
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
