; func_0201c50c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008d00
        .extern func_0200973c
        .extern func_02009788
        .global func_0201c50c
        .arm
func_0201c50c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r0, #0x9
    bl func_02009788
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r5, #0x0
    mov r4, #0x1
.L_358:
    cmp r5, #0x16
    cmpne r5, #0x17
    beq .L_378
    mov r0, r4
    mov r1, r5
    bl func_02008d00
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_378:
    add r5, r5, #0x1
    cmp r5, #0x20
    blt .L_358
    mov r0, #0x9
    bl func_0200973c
    ldmia sp!, {r3, r4, r5, pc}
