; func_0202de9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b8d8
        .global func_0202de9c
        .arm
func_0202de9c:
    stmdb sp!, {r3, lr}
    bl func_0202b8d8
    cmp r0, #0xf
    addls pc, pc, r0, lsl #0x2
    b .L_114c
    b .L_10cc
    b .L_10d4
    b .L_10dc
    b .L_10e4
    b .L_10ec
    b .L_10f4
    b .L_10fc
    b .L_1104
    b .L_110c
    b .L_1114
    b .L_111c
    b .L_1124
    b .L_112c
    b .L_1134
    b .L_113c
    b .L_1144
.L_10cc:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_10d4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_10dc:
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_10e4:
    mov r0, #0x3
    ldmia sp!, {r3, pc}
.L_10ec:
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_10f4:
    mov r0, #0x2
    ldmia sp!, {r3, pc}
.L_10fc:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1104:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_110c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1114:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_111c:
    mov r0, #0x4
    ldmia sp!, {r3, pc}
.L_1124:
    mov r0, #0x5
    ldmia sp!, {r3, pc}
.L_112c:
    mov r0, #0x6
    ldmia sp!, {r3, pc}
.L_1134:
    mov r0, #0x7
    ldmia sp!, {r3, pc}
.L_113c:
    mov r0, #0x8
    ldmia sp!, {r3, pc}
.L_1144:
    mov r0, #0x9
    ldmia sp!, {r3, pc}
.L_114c:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
