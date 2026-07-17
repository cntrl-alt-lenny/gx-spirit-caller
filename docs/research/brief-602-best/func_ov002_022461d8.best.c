
extern void func_ov002_0229cd88(void *self, unsigned int arg1);
extern void func_ov002_0229cdb8(void *self, unsigned int arg1);
extern char data_ov002_022ce288[];
extern char data_ov002_022d016c[];
extern char data_ov002_022cd73c[];
extern char data_ov002_022cd3f4[];
extern char data_ov002_022cacbc[];
void func_ov002_022461d8(void *selfArg)
{
  char *self = (char *) selfArg;
  char *mgr = data_ov002_022ce288;
  *((unsigned short *) self) = 0;
  if ((*((int *) (data_ov002_022ce288 + 0x5d4))) != 0)
  {
    volatile int mode = *((unsigned char *) (data_ov002_022ce288 + 0x5dc));
    unsigned int stashed = *((unsigned int *) (data_ov002_022ce288 + 0x5fc));
    if (mode <= 0x21)
    {
      switch (mode)
      {
        case 1:
          func_ov002_0229cd88(self, 0x3e);
          break;

        case 2:
          func_ov002_0229cd88(self, 0x3f);
          break;

        case 3:

        case 4:
          func_ov002_0229cd88(self, 0x40);
          break;

        case 23:
          if ((*((int *) (data_ov002_022d016c + 0xcec))) != (*((int *) (data_ov002_022cd73c + 4))))
        {
          func_ov002_0229cd88(self, 0x110);
        }
          break;

        case 5:
          if ((*((int *) (data_ov002_022d016c + 0xcec))) == (*((int *) (data_ov002_022cd73c + 4))))
        {
          func_ov002_0229cd88(self, 0x43);
        }
        else
        {
          func_ov002_0229cd88(self, 0xfb);
        }
          break;

        case 6:

        case 7:

        case 8:

        case 9:

        case 10:

        case 31:

        case 32:

        case 33:
        {
          unsigned int code;
          unsigned int bitA;
          unsigned int bitB;
          int match;
          switch (mode)
          {
            case 6:
              code = 0xfc;
              break;

            case 7:
              code = 0xfe;
              break;

            case 8:
              code = 0x100;
              break;

            case 9:
              code = 0xaf;
              break;

            case 10:
              code = 0x9f;
              break;

            case 31:
              code = 0xa9;
              break;

            case 32:
              code = 0xab;
              break;

            default:
              code = 0xad;
              break;

          }

          bitA = ((unsigned int) (stashed << 0xf)) >> 0x1f;
          bitB = ((unsigned int) (stashed << 0x16)) >> 0x1f;
          match = 0;
          if (((*((int *) (data_ov002_022cd73c + 4))) ^ 1) == ((int) (bitA ^ bitB)))
          {
            match = 1;
          }
          func_ov002_0229cd88(self, code + match);
          break;
        }

        case 18:
          if (stashed != 0)
        {
          int match = 0;
          if ((*((int *) data_ov002_022cd3f4)) == ((*((int *) (data_ov002_022cd73c + 4))) ^ 1))
          {
            match = 1;
          }
          func_ov002_0229cd88(self, 0xb6 + match);
        }
        else
        {
          func_ov002_0229cd88(self, 0x9a);
        }
          break;

        case 19:
          func_ov002_0229cd88(self, 0xb5);
          break;

        case 20:
          func_ov002_0229cd88(self, 0xb1);
          break;

        case 13:
          func_ov002_0229cd88(self, 0x10a);
          break;

        case 14:
          func_ov002_0229cd88(self, 0x105);
          break;

        case 15:
        {
          int match = 0;
          if (((*((int *) (data_ov002_022cd73c + 4))) ^ 1) == ((int) (((unsigned int) (stashed << 0xa)) >> 0x1f)))
          {
            match = 1;
          }
          func_ov002_0229cd88(self, 0xb9 + match);
          break;
        }

        case 22:
          func_ov002_0229cd88(self, 0xb8);
          break;

        case 11:
          func_ov002_0229cd88(self, 0xb2);
          break;

        case 12:
          func_ov002_0229cd88(self, 0xb3);
          break;

        case 16:
        {
          int match = 0;
          if (((*((int *) (data_ov002_022cd73c + 4))) ^ 1) == ((int) (((unsigned int) (stashed << 0xf)) >> 0x1f)))
          {
            match = 1;
          }
          func_ov002_0229cd88(self, 0xbd + match);
          break;
        }

        case 24:
          func_ov002_0229cd88(self, 0xc4);
          break;

        case 25:
        {
          int match = 0;
          if (((*((int *) (data_ov002_022cd73c + 4))) ^ 1) == ((int) (((unsigned int) (stashed << 0x16)) >> 0x1f)))
          {
            match = 1;
          }
          func_ov002_0229cd88(self, 0xc5 + match);
          break;
        }

        case 27:
          if (((int) (((unsigned int) (stashed << 0x10)) >> 0x1f)) != 0)
        {
          func_ov002_0229cd88(self, 0x10b);
        }
        else
        {
          unsigned int field = ((unsigned int) (stashed << 9)) >> 0x1c;
          if (field == 0xb)
          {
            func_ov002_0229cd88(self, 0xc7);
          }
          else
            if (field == 0xe)
          {
            func_ov002_0229cd88(self, 0x10c);
          }
        }
          break;

        case 28:
          func_ov002_0229cd88(self, 0xc8);
          break;

        case 29:
        {
          int match = 0;
          if (((*((int *) (data_ov002_022cd73c + 4))) ^ 1) == ((int) (((unsigned int) (stashed << 0x16)) >> 0x1f)))
          {
            match = 1;
          }
          func_ov002_0229cd88(self, 0xc9 + match);
          break;
        }

        case 30:
          func_ov002_0229cd88(self, 0xcb);
          break;

        default:
          break;

      }

    }
    if ((*((unsigned short *) self)) != 0)
    {
      func_ov002_0229cdb8(self, (unsigned int) data_ov002_022cacbc);
    }
  }
  func_ov002_0229cdb8(self, 0x10d);
}
