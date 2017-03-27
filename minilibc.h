/*
** minilibc.h for  in /home/valentin.collomb/Epitech/Year_2/Rendu/ASM/asm_minilibc
**
** Made by Valentin Collomb
** Login   <valentin.collomb@epitech.net>
**
** Started on  Wed Mar  1 16:31:29 2017 Valentin Collomb
** Last update Mon Mar 20 15:34:22 2017 dejean
*/

#ifndef MINILIBC_H_
# define MINILIBC_H_

# include <stddef.h>

/* BASE */

size_t		strlen(const char *s);
int		strcmp(const char *s1, const char *s2);
char		*rindex(const char *s, int c);
char		*strchr(const char *s, int c);
void		*memmove(void *dest, const void *src, size_t n);
char		*strstr(const char *haystack, const char *needle);
void		*memset(void *s, int c, size_t n);
int		strncmp(const char *s1, const char *s2, size_t n);
char		*strpbrk(const char *s, const char *accept);
void		*memcpy(void *dest, const void *src, size_t n);
int		strcasecmp(const char *s1, const char *s2);
size_t		strcspn(const char *s, const char *reject);

/* BONUS */

void		*memfrob(void *s, size_t n);
void		*memccpy(void *dest, const void *src, int c, size_t n);
void		bzero(void *s, size_t n);
void		bcopy(const void *src, void *dest, size_t n);

#endif /* !MINILIBC_H_ */
