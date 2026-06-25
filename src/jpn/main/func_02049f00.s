; func_02049f00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dbd4
        .extern func_020672b4
        .global func_02049f00
        .arm
func_02049f00:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    cmp r0, #0x0
    beq .L_20
    cmp r0, #0x1
    ldmeqia sp!, {r4, r5, r6, pc}
    cmp r0, #0x2
    ldmia sp!, {r4, r5, r6, pc}
.L_20:
    mov r0, r6
    mov r1, #0x8
    bl func_020672b4
    mov r0, r6
    mov r1, #0xa
    bl func_020672b4
    mov r0, r6
    mov r1, #0x32
    bl func_020672b4
    mov r0, r6
    mov r1, #0x33
    bl func_020672b4
    mov r0, r6
    mov r1, #0x34
    bl func_020672b4
    mov r0, r6
    mov r1, #0x35
    bl func_020672b4
    mov r0, r6
    mov r1, #0x36
    bl func_020672b4
    ldr r4, _LIT0
    mov r5, #0x0
.L_7c:
    ldrb r1, [r4]
    cmp r1, #0x0
    beq .L_90
    mov r0, r6
    bl func_020672b4
.L_90:
    add r5, r5, #0x1
    cmp r5, #0x9a
    add r4, r4, #0xc
    blt .L_7c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219dbd4
