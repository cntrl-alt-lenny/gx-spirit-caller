; func_0204bd50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046704
        .extern func_0204987c
        .extern func_0204fbc4
        .extern func_020624e8
        .global func_0204bd50
        .arm
func_0204bd50:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    bl func_0204987c
    str r5, [r0, #0x204]
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    mov r0, r5
    add r1, r1, #0x1
    bl func_02046704
    movs r4, r0
    beq .L_5c
    bl func_0204987c
    mov r1, #0x2
    strb r1, [r0, #0x1a0]
    ldr r0, [r4]
    bl func_020624e8
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x1a0]
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_5c:
    bl func_0204987c
    ldrb r1, [r0, #0xd]
    mov r0, r5
    add r1, r1, #0x1
    bl func_0204fbc4
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
