; func_0203e148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020beb50
        .extern func_0203df38
        .extern func_02094688
        .global func_0203e148
        .arm
func_0203e148:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    add r4, r5, #0x300
    bl func_0203df38
    ldrb r1, [r5, #0xd0c]
    mov r5, r0
    mov r0, #0x24
    mov r1, r1, lsl #0x1c
    mla r4, r5, r0, r4
    movs r0, r1, lsr #0x1c
    beq .L_2e0
    cmp r0, #0x6
    bne .L_304
.L_2e0:
    ldr r0, _LIT0
    add r1, r4, #0x4
    mov r2, #0x8
    bl func_02094688
    mov r1, #0x8
    strb r1, [r4, #0x3]
    add r0, r5, #0x1
    strb r1, [r4, #0x1]
    and r5, r0, #0xff
.L_304:
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_020beb50
