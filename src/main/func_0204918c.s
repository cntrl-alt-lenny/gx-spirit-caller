; func_0204918c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02048108
        .extern func_02052f04
        .global func_0204918c
        .arm
func_0204918c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1]
    ldr r4, [r0, #0x18]
    cmp r4, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, pc}
    bl func_02048108
    mov r1, #0xc
    mla r1, r5, r1, r4
    bl func_02052f04
    cmp r0, #0x0
    beq .L_230
    mvn r1, #0x0
    cmp r0, r1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
.L_230:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dc80
