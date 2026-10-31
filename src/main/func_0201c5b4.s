; func_0201c5b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b59e0
        .extern func_02009758
        .extern func_020097a4
        .extern func_0201934c
        .extern func_020195b8
        .global func_0201c5b4
        .arm
func_0201c5b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x28
    bl GetSystemWork
    ldr r4, _LIT0
    add r3, sp, #0x0
    mov r2, #0x13
.L_18:
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    add r4, r4, #0x2
    strb r1, [r3]
    strb r0, [r3, #0x1]
    add r3, r3, #0x2
    subs r2, r2, #0x1
    bne .L_18
    mov r0, #0x18
    bl func_020097a4
    cmp r0, #0x0
    addne sp, sp, #0x28
    ldmneia sp!, {r4, r5, r6, pc}
    mov r5, #0x0
    add r6, sp, #0x0
    mov r4, r5
.L_58:
    ldrb r0, [r6]
    bl func_0201934c
    mov r1, r4
    bl func_020195b8
    cmp r0, #0x0
    addeq sp, sp, #0x28
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    cmp r5, #0x26
    add r6, r6, #0x1
    bcc .L_58
    mov r0, #0x18
    bl func_02009758
    add sp, sp, #0x28
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020b59e0+0x86
