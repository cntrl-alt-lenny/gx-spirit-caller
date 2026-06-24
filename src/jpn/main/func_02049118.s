; func_02049118 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02048094
        .extern func_02052e90
        .global func_02049118
        .arm
func_02049118:
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
    bl func_02048094
    mov r1, #0xc
    mla r1, r5, r1, r4
    bl func_02052e90
    cmp r0, #0x0
    beq .L_bc
    mvn r1, #0x0
    cmp r0, r1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, pc}
.L_bc:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_0219dba0
