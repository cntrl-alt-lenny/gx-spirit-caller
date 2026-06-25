; func_ov002_022ae608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022ae608
        .arm
func_ov002_022ae608:
    stmdb sp!, {r3, lr}
    mov lr, #0x0
    mov ip, lr
    str lr, [r0, #0x3c]
    mov r3, #0x1
    b .L_3c
.L_18:
    tst r1, r3, lsl ip
    beq .L_38
    add r2, r0, lr, lsl #0x2
    str ip, [r2, #0x1c]
    ldr r2, [r0, #0x3c]
    add lr, lr, #0x1
    add r2, r2, #0x1
    str r2, [r0, #0x3c]
.L_38:
    add ip, ip, #0x1
.L_3c:
    cmp ip, #0xb
    cmplt lr, #0x3
    blt .L_18
    cmp lr, #0x3
    ldmgeia sp!, {r3, pc}
    mvn r2, #0x0
.L_54:
    mov r1, lr, lsl #0x2
    add lr, lr, #0x1
    add r1, r0, r1
    str r2, [r1, #0x1c]
    cmp lr, #0x3
    blt .L_54
    ldmia sp!, {r3, pc}
