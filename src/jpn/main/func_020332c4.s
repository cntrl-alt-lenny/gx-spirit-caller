; func_020332c4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02045780
        .extern func_02045830
        .extern func_02045894
        .global func_020332c4
        .arm
func_020332c4:
    stmdb sp!, {r4, lr}
    add r0, r0, #0x1e8
    mov r4, r1
    add r0, r0, #0xc00
    bl func_02045894
    cmp r4, #0x0
    beq .L_24
    mov r0, #0x2
    bl func_02045830
.L_24:
    bl func_02045780
    mov r0, #0x0
    ldmia sp!, {r4, pc}
