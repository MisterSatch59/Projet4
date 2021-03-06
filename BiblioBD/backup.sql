PGDMP     .        
            v           bibliobd    10.4    10.4 P    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            b           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            c           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            d           1262    16667    bibliobd    DATABASE     �   CREATE DATABASE bibliobd WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE bibliobd;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            e           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            f           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    21339    auteur    TABLE     �   CREATE TABLE public.auteur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100)
);
    DROP TABLE public.auteur;
       public         user    false    3            �            1259    21337    auteur_id_seq    SEQUENCE     v   CREATE SEQUENCE public.auteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.auteur_id_seq;
       public       user    false    3    200            g           0    0    auteur_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.auteur_id_seq OWNED BY public.auteur.id;
            public       user    false    199            �            1259    21354    bibliotheque    TABLE     M   CREATE TABLE public.bibliotheque (
    nom character varying(50) NOT NULL
);
     DROP TABLE public.bibliotheque;
       public         user    false    3            �            1259    21366    description    TABLE     _   CREATE TABLE public.description (
    id integer NOT NULL,
    titre character varying(100)
);
    DROP TABLE public.description;
       public         user    false    3            �            1259    21364    description_id_seq    SEQUENCE     {   CREATE SEQUENCE public.description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.description_id_seq;
       public       user    false    206    3            h           0    0    description_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.description_id_seq OWNED BY public.description.id;
            public       user    false    205            �            1259    21331    editeur    TABLE     b   CREATE TABLE public.editeur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);
    DROP TABLE public.editeur;
       public         user    false    3            �            1259    21329    editeur_id_seq    SEQUENCE     w   CREATE SEQUENCE public.editeur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.editeur_id_seq;
       public       user    false    198    3            i           0    0    editeur_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.editeur_id_seq OWNED BY public.editeur.id;
            public       user    false    197            �            1259    21397 
   exemplaire    TABLE     �   CREATE TABLE public.exemplaire (
    id integer NOT NULL,
    isbn character varying(20) NOT NULL,
    bibliotheque character varying(50) NOT NULL
);
    DROP TABLE public.exemplaire;
       public         user    false    3            �            1259    21395    exemplaire_id_seq    SEQUENCE     z   CREATE SEQUENCE public.exemplaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.exemplaire_id_seq;
       public       user    false    212    3            j           0    0    exemplaire_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.exemplaire_id_seq OWNED BY public.exemplaire.id;
            public       user    false    211            �            1259    21359    genre    TABLE     F   CREATE TABLE public.genre (
    nom character varying(20) NOT NULL
);
    DROP TABLE public.genre;
       public         user    false    3            �            1259    21324    langue    TABLE     G   CREATE TABLE public.langue (
    nom character varying(50) NOT NULL
);
    DROP TABLE public.langue;
       public         user    false    3            �            1259    21380    livre    TABLE       CREATE TABLE public.livre (
    isbn character varying(20) NOT NULL,
    titre character varying(100) NOT NULL,
    editeur_id integer NOT NULL,
    date_publication date NOT NULL,
    description_id integer NOT NULL,
    langue character varying(50) NOT NULL
);
    DROP TABLE public.livre;
       public         user    false    3            �            1259    21390    livre_auteur    TABLE     n   CREATE TABLE public.livre_auteur (
    isbn character varying(20) NOT NULL,
    auteur_id integer NOT NULL
);
     DROP TABLE public.livre_auteur;
       public         user    false    3            �            1259    21385    livre_genre    TABLE     u   CREATE TABLE public.livre_genre (
    isbn character varying(20) NOT NULL,
    nom character varying(20) NOT NULL
);
    DROP TABLE public.livre_genre;
       public         user    false    3            �            1259    21372 
   paragraphe    TABLE     �   CREATE TABLE public.paragraphe (
    decription_id integer NOT NULL,
    ordre integer NOT NULL,
    texte character varying NOT NULL
);
    DROP TABLE public.paragraphe;
       public         user    false    3            �            1259    21403    pret    TABLE     �   CREATE TABLE public.pret (
    id integer NOT NULL,
    date_debut date NOT NULL,
    date_fin character varying,
    renouvele boolean NOT NULL,
    utilisateur_id integer NOT NULL,
    exemplaire_id integer NOT NULL
);
    DROP TABLE public.pret;
       public         user    false    3            �            1259    21347    utilisateur    TABLE       CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100),
    mdp character varying(100) NOT NULL,
    sel character varying(20) NOT NULL
);
    DROP TABLE public.utilisateur;
       public         user    false    3            �            1259    21345    utilisateur_id_seq    SEQUENCE     {   CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.utilisateur_id_seq;
       public       user    false    3    202            k           0    0    utilisateur_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;
            public       user    false    201            �
           2604    21342 	   auteur id    DEFAULT     f   ALTER TABLE ONLY public.auteur ALTER COLUMN id SET DEFAULT nextval('public.auteur_id_seq'::regclass);
 8   ALTER TABLE public.auteur ALTER COLUMN id DROP DEFAULT;
       public       user    false    200    199    200            �
           2604    21369    description id    DEFAULT     p   ALTER TABLE ONLY public.description ALTER COLUMN id SET DEFAULT nextval('public.description_id_seq'::regclass);
 =   ALTER TABLE public.description ALTER COLUMN id DROP DEFAULT;
       public       user    false    206    205    206            �
           2604    21334 
   editeur id    DEFAULT     h   ALTER TABLE ONLY public.editeur ALTER COLUMN id SET DEFAULT nextval('public.editeur_id_seq'::regclass);
 9   ALTER TABLE public.editeur ALTER COLUMN id DROP DEFAULT;
       public       user    false    197    198    198            �
           2604    21400    exemplaire id    DEFAULT     n   ALTER TABLE ONLY public.exemplaire ALTER COLUMN id SET DEFAULT nextval('public.exemplaire_id_seq'::regclass);
 <   ALTER TABLE public.exemplaire ALTER COLUMN id DROP DEFAULT;
       public       user    false    212    211    212            �
           2604    21350    utilisateur id    DEFAULT     p   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);
 =   ALTER TABLE public.utilisateur ALTER COLUMN id DROP DEFAULT;
       public       user    false    201    202    202            Q          0    21339    auteur 
   TABLE DATA               1   COPY public.auteur (id, nom, prenom) FROM stdin;
    public       user    false    200   �T       T          0    21354    bibliotheque 
   TABLE DATA               +   COPY public.bibliotheque (nom) FROM stdin;
    public       user    false    203   �T       W          0    21366    description 
   TABLE DATA               0   COPY public.description (id, titre) FROM stdin;
    public       user    false    206   2U       O          0    21331    editeur 
   TABLE DATA               *   COPY public.editeur (id, nom) FROM stdin;
    public       user    false    198   zU       ]          0    21397 
   exemplaire 
   TABLE DATA               <   COPY public.exemplaire (id, isbn, bibliotheque) FROM stdin;
    public       user    false    212   �U       U          0    21359    genre 
   TABLE DATA               $   COPY public.genre (nom) FROM stdin;
    public       user    false    204   �W       M          0    21324    langue 
   TABLE DATA               %   COPY public.langue (nom) FROM stdin;
    public       user    false    196   8X       Y          0    21380    livre 
   TABLE DATA               b   COPY public.livre (isbn, titre, editeur_id, date_publication, description_id, langue) FROM stdin;
    public       user    false    208   mX       [          0    21390    livre_auteur 
   TABLE DATA               7   COPY public.livre_auteur (isbn, auteur_id) FROM stdin;
    public       user    false    210   �Z       Z          0    21385    livre_genre 
   TABLE DATA               0   COPY public.livre_genre (isbn, nom) FROM stdin;
    public       user    false    209   B[       X          0    21372 
   paragraphe 
   TABLE DATA               A   COPY public.paragraphe (decription_id, ordre, texte) FROM stdin;
    public       user    false    207   �[       ^          0    21403    pret 
   TABLE DATA               b   COPY public.pret (id, date_debut, date_fin, renouvele, utilisateur_id, exemplaire_id) FROM stdin;
    public       user    false    213   Mo       S          0    21347    utilisateur 
   TABLE DATA               G   COPY public.utilisateur (id, email, nom, prenom, mdp, sel) FROM stdin;
    public       user    false    202   �o       l           0    0    auteur_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.auteur_id_seq', 1, false);
            public       user    false    199            m           0    0    description_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.description_id_seq', 1, false);
            public       user    false    205            n           0    0    editeur_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.editeur_id_seq', 1, false);
            public       user    false    197            o           0    0    exemplaire_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.exemplaire_id_seq', 79, true);
            public       user    false    211            p           0    0    utilisateur_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, false);
            public       user    false    201            �
           2606    21344    auteur auteur_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.auteur
    ADD CONSTRAINT auteur_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.auteur DROP CONSTRAINT auteur_pk;
       public         user    false    200            �
           2606    21358    bibliotheque bibliotheque_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.bibliotheque
    ADD CONSTRAINT bibliotheque_pk PRIMARY KEY (nom);
 F   ALTER TABLE ONLY public.bibliotheque DROP CONSTRAINT bibliotheque_pk;
       public         user    false    203            �
           2606    21371    description description_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.description DROP CONSTRAINT description_pk;
       public         user    false    206            �
           2606    21336    editeur editeur_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.editeur
    ADD CONSTRAINT editeur_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.editeur DROP CONSTRAINT editeur_pk;
       public         user    false    198            �
           2606    21402    exemplaire exemplaire_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT exemplaire_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT exemplaire_pk;
       public         user    false    212            �
           2606    21363    genre genre_pk 
   CONSTRAINT     M   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pk PRIMARY KEY (nom);
 8   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pk;
       public         user    false    204            �
           2606    21328    langue langue_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.langue
    ADD CONSTRAINT langue_pk PRIMARY KEY (nom);
 :   ALTER TABLE ONLY public.langue DROP CONSTRAINT langue_pk;
       public         user    false    196            �
           2606    21394    livre_auteur livre_auteur_pk 
   CONSTRAINT     g   ALTER TABLE ONLY public.livre_auteur
    ADD CONSTRAINT livre_auteur_pk PRIMARY KEY (isbn, auteur_id);
 F   ALTER TABLE ONLY public.livre_auteur DROP CONSTRAINT livre_auteur_pk;
       public         user    false    210    210            �
           2606    21389    livre_genre livre_genre_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.livre_genre
    ADD CONSTRAINT livre_genre_pk PRIMARY KEY (isbn, nom);
 D   ALTER TABLE ONLY public.livre_genre DROP CONSTRAINT livre_genre_pk;
       public         user    false    209    209            �
           2606    21384    livre livre_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT livre_pk PRIMARY KEY (isbn);
 8   ALTER TABLE ONLY public.livre DROP CONSTRAINT livre_pk;
       public         user    false    208            �
           2606    21379    paragraphe paragraphe_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.paragraphe
    ADD CONSTRAINT paragraphe_pk PRIMARY KEY (decription_id, ordre);
 B   ALTER TABLE ONLY public.paragraphe DROP CONSTRAINT paragraphe_pk;
       public         user    false    207    207            �
           2606    21410    pret pret_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.pret
    ADD CONSTRAINT pret_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pret DROP CONSTRAINT pret_pk;
       public         user    false    213            �
           2606    21352    utilisateur utilisateur_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public         user    false    202            �
           1259    21353    utilisateur_idx    INDEX     O   CREATE UNIQUE INDEX utilisateur_idx ON public.utilisateur USING btree (email);
 #   DROP INDEX public.utilisateur_idx;
       public         user    false    202            �
           2606    21421 #   livre_auteur auteur_auteur_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre_auteur
    ADD CONSTRAINT auteur_auteur_livre_fk FOREIGN KEY (auteur_id) REFERENCES public.auteur(id);
 M   ALTER TABLE ONLY public.livre_auteur DROP CONSTRAINT auteur_auteur_livre_fk;
       public       user    false    210    2738    200            �
           2606    21431 %   exemplaire bibliotheque_exemplaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT bibliotheque_exemplaire_fk FOREIGN KEY (bibliotheque) REFERENCES public.bibliotheque(nom);
 O   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT bibliotheque_exemplaire_fk;
       public       user    false    2743    212    203            �
           2606    21441    livre description_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT description_livre_fk FOREIGN KEY (description_id) REFERENCES public.description(id);
 D   ALTER TABLE ONLY public.livre DROP CONSTRAINT description_livre_fk;
       public       user    false    208    2747    206            �
           2606    21446 $   paragraphe description_paragraphe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.paragraphe
    ADD CONSTRAINT description_paragraphe_fk FOREIGN KEY (decription_id) REFERENCES public.description(id);
 N   ALTER TABLE ONLY public.paragraphe DROP CONSTRAINT description_paragraphe_fk;
       public       user    false    2747    206    207            �
           2606    21416    livre editeur_livre_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT editeur_livre_fk FOREIGN KEY (editeur_id) REFERENCES public.editeur(id);
 @   ALTER TABLE ONLY public.livre DROP CONSTRAINT editeur_livre_fk;
       public       user    false    198    2736    208            �
           2606    21466    pret exemplaire_pret_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pret
    ADD CONSTRAINT exemplaire_pret_fk FOREIGN KEY (exemplaire_id) REFERENCES public.exemplaire(id);
 A   ALTER TABLE ONLY public.pret DROP CONSTRAINT exemplaire_pret_fk;
       public       user    false    2757    212    213            �
           2606    21436     livre_genre genre_livre_genre_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.livre_genre
    ADD CONSTRAINT genre_livre_genre_fk FOREIGN KEY (nom) REFERENCES public.genre(nom);
 J   ALTER TABLE ONLY public.livre_genre DROP CONSTRAINT genre_livre_genre_fk;
       public       user    false    209    2745    204            �
           2606    21411    livre langue_livre_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT langue_livre_fk FOREIGN KEY (langue) REFERENCES public.langue(nom);
 ?   ALTER TABLE ONLY public.livre DROP CONSTRAINT langue_livre_fk;
       public       user    false    208    2734    196            �
           2606    21456 "   livre_auteur livre_auteur_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre_auteur
    ADD CONSTRAINT livre_auteur_livre_fk FOREIGN KEY (isbn) REFERENCES public.livre(isbn);
 L   ALTER TABLE ONLY public.livre_auteur DROP CONSTRAINT livre_auteur_livre_fk;
       public       user    false    210    2751    208            �
           2606    21451    exemplaire livre_exemplaire_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT livre_exemplaire_fk FOREIGN KEY (isbn) REFERENCES public.livre(isbn);
 H   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT livre_exemplaire_fk;
       public       user    false    212    2751    208            �
           2606    21461     livre_genre livre_livre_genre_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.livre_genre
    ADD CONSTRAINT livre_livre_genre_fk FOREIGN KEY (isbn) REFERENCES public.livre(isbn);
 J   ALTER TABLE ONLY public.livre_genre DROP CONSTRAINT livre_livre_genre_fk;
       public       user    false    209    2751    208            �
           2606    21426    pret utilisateur_pret_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pret
    ADD CONSTRAINT utilisateur_pret_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);
 B   ALTER TABLE ONLY public.pret DROP CONSTRAINT utilisateur_pret_fk;
       public       user    false    213    2741    202            Q   F   x�3��/���K������2�����L�r���˘�7�2���+?+�˄ӱ837��ӳ811�+F��� ^��      T   9   x�s�L���/�8���4U!95��(1'��	E8%�X!?3��prb^bQJ1W� �Ob      W   8   x��9  ��C���@�uP�Ig��nTh�a���XY'y�M~r������7      O   b   x��1
�0�z�)�m'���
����D2`p�@o�{%M^$^>��،Q��'�ԋ�e��7QB�d�W=_U���_��|�٭l���$      ]   �  x���Kn�0�us
.�ʯ��l{�n(D*�z�^�� 6Y�#R�����$��S}M�F�/����|�����7��t�l�㐜.;]��~�n·�:�ӡ�v�����䧵�T �Ԇ�.�:1za���&��,lA�x!�W"�׬+�rJ ���&��){a��\<-G�A|M�B�ª�އ�0/�6�W(�v1"E�
����V��d',���R���.F��)�,���{w�B��jöB�p�R�Ӄ���u��dÖ����%�t�aK�O)�P+ �ܝt�ӫ[:/,��1�_}��t|��b����Y�=�ذ���2��ÞN6l���r�wd�t
6l���^WcL�7J�=��{z�aK/O��ě
�{:ڰ�?�4-Q `��DU�=�m8�������      U   �   x�M�=�0�w���-P!��bb1�j,��R���s�b��{z?_S�<X�wd2hFʥ*Avڿf�Ќ?���٠�\�&8�a��f2#8I)%��e���5�n����dR����5t���˷8���P�Ʉ��� ~��?,      M   %   x�s+J�;�<1���1/=L���&�p��qqq ̽
�      Y   K  x����n�0Ưݧ�]AZ���I�]�@t�Z'���MMk-��㠍�᎕�ȋq��c�SM�E�Կ���HҀ��đ�E�>H����z�������+����ys�m��FU��.��U�"F((	��K'M�G�j&N|�P�#�q!�,��(�R�S�Q!nH���()LJ(�w���@�x3�~�ʵ4}���M�˙.l�o{���3�Г��g�i�S��9}ׇ�i� �~f4K�M���f\5���׈�hP:Ҙ��*�@�ue��k$��s
�8a=\�0^y�M��U�J0	"H0�R��*���`���i�?ɲl��0�9��*S��k��O�IS�c>(�c����ta+��)7��F�Š�( �[ JPf�ũ�/Ӽ.#�n�?E���=\wB��i�p�Jo���f�(Y��W7�T��ֺeYY��Н������\F`� �BD'c"�� ��W�pckW��٣L�80X���k����G�K)e��$F�Oi<�VC�:#�֋���mq�l������G	��	�n�0��oPg��W�8{���iR�]�PE[��<|{3����Z�m      [   j   x�]��1г�e#�0�l�ućX��8=1@��\���-!P� �1#�7�}��,B�d�>������:L���^��,ZDwO�?@��������!�/O�5�      Z   �   x�mѱ� �񹼋=$$/�ਫK���|{�u�����~p��)���X����'X�/�{�[��=�v�k���!gp�5C.rψ[,��2�D�{�xf&_RS�7r5�u7H*Q�Y�?}�!�\�7QR��S=�lq7%J~�*�������&5w�wGf����1���Qä4      X      x��ZˎGv]��"��Mu�Ԍ=�6ɖDi�G�D��&*3�*���dDFu7W��f5C0�Z�J����O�%>��Ȭ��l��^H��G�}�{�#��?x���>GS;�\2��<�1ޚ��8��29�>;��`�����;3�(�C�:�F���h������������¸2�ޏ&����K�3�>c!�t���`��^7{�7�~�s������s��?C�\�6�+�t��zn�X��u�;��|��Ѹ`6��~e^;����c�w;��a�d�طm2����8������r�U�<ݭ͕�����4N�D���Ě�{�RS�=wM�[��:߮��5��r�Pw�� e�y�-����w�������7~z�AP�a�i��,7)��B��V.����b�4+�����G+��vI���"���#v�mL�Q.�n�0��|���[*�Nw��F�s��X�>;�)����{!>	�K*�R6zy��o�[��Ύ�N��!����%����X��ټ����Մpu���x�[�xtݠrj�ť��Z�dg�MT{�pUtX�c�����f���=)���u(Uh|즻d���?-�r�m<��>�n{�vOƇ��zD���N���1z�t	s��ve�$-%�_�����
_3G���f�=E������"�5������Ý6C�n�G�\HׇZM�u!�*j�Cg��U��Y��B�b�cܭ�H-]��6������@X��>�����Vo��j�+�������؆~Ԯ��Vt ���K�:DOR���{@j}»Xy=�:y�����\\�U9��������H�ˁ�J��GlUX��B��I�;#\[�g%���_ ��("�p���Pt�1_��d���G"�z�N���4�~���WK(�~_�XQ��n���X�%V�h�#n����N�*PvP�F�4ND�Tm ]�{`�c*��6���{N1�oAI���Tb��#�#/����I�9�G��1��1��c�?�����*���(V���:�.�^;�f6���c%L�h����_)@��	�ػ����σ�m�J/sX�N��E6�����r[r���l�
����"�W@(�#0^�)�D,���>�H���q�l0g��{��w��4����$�M�t����e�����^Sm����V��a��$��*~I=J ����kB�Sh~G�ǵy��ǈ}>�C-��~���)$\Vc�2���tP0@rb>�Ll�qnu�v����#�ݾ�~b�ӏ-\��Fr�r��{���NF���j�VD8������D�L�1v�b��U|&N�©�đK!9�N�(�&qB�GXn�SÁ��J8��A4Fm��ˍ�*��s[��KE!VHt���r�� p�IJ� q�ICEX �rHb6�:�r����0]\�_��/����s�.��%��3w�e߉�����_���W�d����.1�Y܀��6v����4�
�	I���긒(!s�������@D≴S+�8��2�gz8���ڶ}LZ�D����{.'yBk!�� �#`��2P�@RӦ�>n-ĥ ci Tr3b��Er�0Φp�G��dN�%Hl�&����d[BG��p{	�J�=s���wDK`�w�R�P��յyL�L?j��k��-��I�!�{�mB+�^�G��I�\�k����Z��w��qp�v<LyTgn��Gչ��P|ʍ_s�A�{�r?��e/=�^xX�X�%9�}�k�C3�'V�1�=�hެ��Erè���}ℏF�m�Q0�x�n����5�9C!-�A�.G6 �8(����)����J�����0[,��"�z�]li��'�~��S��AC9	���jj��[ �m����BvǒPz��Hp2��=yEUgj�EN�� ������	lWK����1�n���ͨ�.�E��p ���#Ų���9;��bEP=������_�2 ,^���z9Ul*Pm��|,���*#i��^�z��j�g�X�߯��և��H*��P��Ȏ�][x>�)4��S�ʹYdlA���� $�����R��$$�<�����,r�{̵x��ҫ��n��1oDȂ���O��}��w�kJ�`c�bh����v�eK�{�Q���gI�th+��% d�X4O�����,H��B���N�,5�X��2^�$��g�[?������癑Y0z<L�?f��S�Ќt����J��RE��a
-u(�Dˁ�P�ʔ����!*�"��mI��!O]�:�leE��G)Q�[&ɇ7�)D���ճ$���a._2���EӲ2-��Z".����Է���}������j�Y�{���,�����,����V���Kf^�/�z��\ ��"����"{RI��J[��#_�:���ݛ8���̷Rދ]�v���w�CxoQQ�Y�_B%)	ߵ��,�ζJ�pYC���o9���ɌK�����(T򩘈�	�1�'+�$ۡ�)L+xA�	n���Y��z��F(<� �b�/���4���
)kk��͛esa�j2TW����ǘ_d�rg_�hk� 6��;;��=�]�ۖQ͋j�&�4�ߐ%ݍ��uhm���l�k�	�q����;ޓ���<2�g��y ��׈|�cĚ��ěQ�m`�,�3a���%�&��Pޛ��b�Ǵ�+s��T���Q=>�ݸ�us0o�ﻡq��K����<)
x�)��rp�,��,�AF��d~o�Lٗ��޴����A�w #�A��;���P�4�wC>0�@I�ʝ��r�w��A'�b�~�ի�%!#��@�]����&�s���k��t[v,�Ovmw��h�eG���79H{�;4�.^�_o��@��</�5a?�]�Y�1����I換Q���DᏱ�6�< �r#����m�B;.� �R�[��z�~L�5��W�*�g4텵�}��q$4�q����?ܟ��q������'�msX��&w�"�@�J�D�?�p0�ޭ{�-�m8 ���o����ͣZfX�6bA'z�5n�`��O;�N�b��#��cDv��,H{!���7c{��%UvĢ�[�r��;6���2OX�vD��#8"�c�㸫-��R*�qnl݅�Ū[�'�	S+j8\��ɜ�a7���F�Љ#$����J�]�{#���w�ALX�ހ�-�1�X� ��}K^q*UE�N�y%��[���D&��Ef�#S�fÚn��և4DbS|m��>V���3�J���TB�[���R-�v����>���W��l���E���\��Bcn��Vo8����@��E]P�ۈ�vy��ͷ5�o�u��ǉq�B�ܜ�#���������|>�Ϭ����G/^��O?1W�>��������Ç��E0:�X�E֯e�k����G�w�$$� ʣ�w=R�rՌ��~��U7# ���I.[��4��!������V��2��j�ioi	Դ�c����Mr�܈;�z�����#�k<5�!ք�(��;�adЁ+k�@.d�q&	�����H�L�n� <J���R@I�i{�@qf�V�d���D�zQ`p����?M��}��h>B���9J��/ᓾ�A򉧰�gS�g���_H���hF�/3�������OP	=��z��XT�Z�r0��M8K�	o9�`���oQK�lɚ踜�r8��	o}������,I�*�$S8��E"�ż�/l�r�"yT�Q:�Mi8I�c��/A̜i�����������J�Q}j���2�G�m�g�w�'K��e�5x=����"�q2�r���"tG����=�/�����Z�R&*��l��y�y�1)m��g.Ž�_��W��]6��x��\z�T�Flgh�gŏj����&�**�]i�`�.٭��	h��H��'��Uؚ�q�q���q���y�w=����	�ڞ�!'_E[�ݕ�7-�N^��U�EBH�,'��Ϗr'M2�"��v�rL-S`��P�-�G��� 9  ���9 \�K��P���~r��g`X�-Z��-=ݯV&JKG��	�CҖ��l� ����^Ր�C(Ԓ�8'��F��@[#s�2^�إ���:0�Ԡ	g �Z�znI�<Ϋ�g	�xn1�|��p<��Z���Wu�%Y�w<��9��hB0V#_K�C��T�a3;����O���D��sˎv>�_p'�l���f�LT�:�W�gy �����i8X;׋���_����z�nu��s�N�]�˟��㣰mݨ�>Z�yl�GnSy������L�H��"����c'����u��"�lc,v�T��<e,������~��n"&V�ηl�+��q��p��{lN�ʅd��2<�
b���|��z�D�CB�(��S��{�x"%�9E�Kr��4�d��{���â�1M޳уo^�	�r�5p,��Ƽ�$|��o�x$��S4"��c�5������`XBQ'�;=n����'�h� BlP�u~����wcsE��s#�ىD�	��;�G��7���_Se�O�!73<��K'%�@50mk�J�X�%B*P�̏��r��<\)����b�Y�l*�cE]�S���9}Hc�EʾoJP�~�(sO�Z?�d���3�0��C�H�G�N�Y��7/�i�7��'��Y��3�u����(@��lÑ�gv�ggr&<�>�nP���~D!�|�����=Aj~���Q^��<8M㹐��h��A��t�p���tm�_;:�Ҁ�?�35kN"��惗��S~M8N @O?-����,�j¥�/����mC)�x��w�0�����g��>;;�o鱊J      ^   =   x�3�420��50�50���,�4�4�2�����DӀ���\�Pas]c���9W� ۈ�      S   v   x�3��J-Jͭ���/I�+vH�M���K����pz^Ytxen%��{��s��GxnX��yUi����I@���Y��_q�cx~�~��Qdy�-g�A��g��wU��Y�Q^�Z�	W� :w&4     