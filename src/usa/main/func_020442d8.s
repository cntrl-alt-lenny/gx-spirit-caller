; func_020442d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020442d8
        .arm
func_020442d8:
    stmdb sp!, {r4, lr}
    mov lr, #0x0
    mov r4, lr
    mov r2, lr
.L_10:
    ldrb r3, [r0, lr]
    mov ip, r2
.L_18:
    mov r1, r3, asr ip
    ands r1, r1, #0x1
    add ip, ip, #0x1
    addne r4, r4, #0x1
    cmp ip, #0x8
    blt .L_18
    add lr, lr, #0x1
    cmp lr, #0x4
    blt .L_10
    and r0, r4, #0xff
    ldmia sp!, {r4, pc}
