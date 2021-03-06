PGDMP         -                v           bibliobd    10.4    10.4 P    a           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                       false    1            �            1259    19563    auteur    TABLE     �   CREATE TABLE public.auteur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100)
);
    DROP TABLE public.auteur;
       public         user    false    3            �            1259    19561    auteur_id_seq    SEQUENCE     v   CREATE SEQUENCE public.auteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.auteur_id_seq;
       public       user    false    3    200            g           0    0    auteur_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.auteur_id_seq OWNED BY public.auteur.id;
            public       user    false    199            �            1259    19578    bibliotheque    TABLE     M   CREATE TABLE public.bibliotheque (
    nom character varying(50) NOT NULL
);
     DROP TABLE public.bibliotheque;
       public         user    false    3            �            1259    19590    description    TABLE     _   CREATE TABLE public.description (
    id integer NOT NULL,
    titre character varying(100)
);
    DROP TABLE public.description;
       public         user    false    3            �            1259    19588    description_id_seq    SEQUENCE     {   CREATE SEQUENCE public.description_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.description_id_seq;
       public       user    false    206    3            h           0    0    description_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.description_id_seq OWNED BY public.description.id;
            public       user    false    205            �            1259    19555    editeur    TABLE     b   CREATE TABLE public.editeur (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);
    DROP TABLE public.editeur;
       public         user    false    3            �            1259    19553    editeur_id_seq    SEQUENCE     w   CREATE SEQUENCE public.editeur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.editeur_id_seq;
       public       user    false    198    3            i           0    0    editeur_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.editeur_id_seq OWNED BY public.editeur.id;
            public       user    false    197            �            1259    19621 
   exemplaire    TABLE     �   CREATE TABLE public.exemplaire (
    id integer NOT NULL,
    isbn character varying(20) NOT NULL,
    bibliotheque character varying(50) NOT NULL
);
    DROP TABLE public.exemplaire;
       public         user    false    3            �            1259    19619    exemplaire_id_seq    SEQUENCE     z   CREATE SEQUENCE public.exemplaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.exemplaire_id_seq;
       public       user    false    212    3            j           0    0    exemplaire_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.exemplaire_id_seq OWNED BY public.exemplaire.id;
            public       user    false    211            �            1259    19583    genre    TABLE     F   CREATE TABLE public.genre (
    nom character varying(20) NOT NULL
);
    DROP TABLE public.genre;
       public         user    false    3            �            1259    19548    langue    TABLE     G   CREATE TABLE public.langue (
    nom character varying(50) NOT NULL
);
    DROP TABLE public.langue;
       public         user    false    3            �            1259    19604    livre    TABLE       CREATE TABLE public.livre (
    isbn character varying(20) NOT NULL,
    titre character varying(100) NOT NULL,
    editeur_id integer NOT NULL,
    date_publication date NOT NULL,
    description_id integer NOT NULL,
    langue character varying(50) NOT NULL
);
    DROP TABLE public.livre;
       public         user    false    3            �            1259    19614    livre_auteur    TABLE     n   CREATE TABLE public.livre_auteur (
    isbn character varying(20) NOT NULL,
    auteur_id integer NOT NULL
);
     DROP TABLE public.livre_auteur;
       public         user    false    3            �            1259    19609    livre_genre    TABLE     u   CREATE TABLE public.livre_genre (
    isbn character varying(20) NOT NULL,
    nom character varying(20) NOT NULL
);
    DROP TABLE public.livre_genre;
       public         user    false    3            �            1259    19596 
   paragraphe    TABLE     �   CREATE TABLE public.paragraphe (
    decription_id integer NOT NULL,
    ordre integer NOT NULL,
    texte character varying NOT NULL
);
    DROP TABLE public.paragraphe;
       public         user    false    3            �            1259    19627    pret    TABLE     �   CREATE TABLE public.pret (
    id integer NOT NULL,
    date_debut date NOT NULL,
    date_fin character varying,
    renouvele boolean NOT NULL,
    utilisateur_id integer NOT NULL,
    exemplaire_id integer NOT NULL
);
    DROP TABLE public.pret;
       public         user    false    3            �            1259    19571    utilisateur    TABLE       CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    nom character varying(100) NOT NULL,
    prenom character varying(100),
    mdp character varying(100) NOT NULL,
    sel character varying(20) NOT NULL
);
    DROP TABLE public.utilisateur;
       public         user    false    3            �            1259    19569    utilisateur_id_seq    SEQUENCE     {   CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.utilisateur_id_seq;
       public       user    false    3    202            k           0    0    utilisateur_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;
            public       user    false    201            �
           2604    19566 	   auteur id    DEFAULT     f   ALTER TABLE ONLY public.auteur ALTER COLUMN id SET DEFAULT nextval('public.auteur_id_seq'::regclass);
 8   ALTER TABLE public.auteur ALTER COLUMN id DROP DEFAULT;
       public       user    false    200    199    200            �
           2604    19593    description id    DEFAULT     p   ALTER TABLE ONLY public.description ALTER COLUMN id SET DEFAULT nextval('public.description_id_seq'::regclass);
 =   ALTER TABLE public.description ALTER COLUMN id DROP DEFAULT;
       public       user    false    206    205    206            �
           2604    19558 
   editeur id    DEFAULT     h   ALTER TABLE ONLY public.editeur ALTER COLUMN id SET DEFAULT nextval('public.editeur_id_seq'::regclass);
 9   ALTER TABLE public.editeur ALTER COLUMN id DROP DEFAULT;
       public       user    false    197    198    198            �
           2604    19624    exemplaire id    DEFAULT     n   ALTER TABLE ONLY public.exemplaire ALTER COLUMN id SET DEFAULT nextval('public.exemplaire_id_seq'::regclass);
 <   ALTER TABLE public.exemplaire ALTER COLUMN id DROP DEFAULT;
       public       user    false    212    211    212            �
           2604    19574    utilisateur id    DEFAULT     p   ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);
 =   ALTER TABLE public.utilisateur ALTER COLUMN id DROP DEFAULT;
       public       user    false    201    202    202            Q          0    19563    auteur 
   TABLE DATA               1   COPY public.auteur (id, nom, prenom) FROM stdin;
    public       user    false    200   �T       T          0    19578    bibliotheque 
   TABLE DATA               +   COPY public.bibliotheque (nom) FROM stdin;
    public       user    false    203   �T       W          0    19590    description 
   TABLE DATA               0   COPY public.description (id, titre) FROM stdin;
    public       user    false    206   U       O          0    19555    editeur 
   TABLE DATA               *   COPY public.editeur (id, nom) FROM stdin;
    public       user    false    198   9U       ]          0    19621 
   exemplaire 
   TABLE DATA               <   COPY public.exemplaire (id, isbn, bibliotheque) FROM stdin;
    public       user    false    212   kU       U          0    19583    genre 
   TABLE DATA               $   COPY public.genre (nom) FROM stdin;
    public       user    false    204   �V       M          0    19548    langue 
   TABLE DATA               %   COPY public.langue (nom) FROM stdin;
    public       user    false    196   sW       Y          0    19604    livre 
   TABLE DATA               b   COPY public.livre (isbn, titre, editeur_id, date_publication, description_id, langue) FROM stdin;
    public       user    false    208   �W       [          0    19614    livre_auteur 
   TABLE DATA               7   COPY public.livre_auteur (isbn, auteur_id) FROM stdin;
    public       user    false    210   �X       Z          0    19609    livre_genre 
   TABLE DATA               0   COPY public.livre_genre (isbn, nom) FROM stdin;
    public       user    false    209   Y       X          0    19596 
   paragraphe 
   TABLE DATA               A   COPY public.paragraphe (decription_id, ordre, texte) FROM stdin;
    public       user    false    207   �Y       ^          0    19627    pret 
   TABLE DATA               b   COPY public.pret (id, date_debut, date_fin, renouvele, utilisateur_id, exemplaire_id) FROM stdin;
    public       user    false    213   �c       S          0    19571    utilisateur 
   TABLE DATA               G   COPY public.utilisateur (id, email, nom, prenom, mdp, sel) FROM stdin;
    public       user    false    202   �c       l           0    0    auteur_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.auteur_id_seq', 1, false);
            public       user    false    199            m           0    0    description_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.description_id_seq', 1, false);
            public       user    false    205            n           0    0    editeur_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.editeur_id_seq', 1, false);
            public       user    false    197            o           0    0    exemplaire_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.exemplaire_id_seq', 83, true);
            public       user    false    211            p           0    0    utilisateur_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, false);
            public       user    false    201            �
           2606    19568    auteur auteur_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.auteur
    ADD CONSTRAINT auteur_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.auteur DROP CONSTRAINT auteur_pk;
       public         user    false    200            �
           2606    19582    bibliotheque bibliotheque_pk 
   CONSTRAINT     [   ALTER TABLE ONLY public.bibliotheque
    ADD CONSTRAINT bibliotheque_pk PRIMARY KEY (nom);
 F   ALTER TABLE ONLY public.bibliotheque DROP CONSTRAINT bibliotheque_pk;
       public         user    false    203            �
           2606    19595    description description_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.description
    ADD CONSTRAINT description_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.description DROP CONSTRAINT description_pk;
       public         user    false    206            �
           2606    19560    editeur editeur_pk 
   CONSTRAINT     P   ALTER TABLE ONLY public.editeur
    ADD CONSTRAINT editeur_pk PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.editeur DROP CONSTRAINT editeur_pk;
       public         user    false    198            �
           2606    19626    exemplaire exemplaire_pk 
   CONSTRAINT     V   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT exemplaire_pk PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT exemplaire_pk;
       public         user    false    212            �
           2606    19587    genre genre_pk 
   CONSTRAINT     M   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pk PRIMARY KEY (nom);
 8   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pk;
       public         user    false    204            �
           2606    19552    langue langue_pk 
   CONSTRAINT     O   ALTER TABLE ONLY public.langue
    ADD CONSTRAINT langue_pk PRIMARY KEY (nom);
 :   ALTER TABLE ONLY public.langue DROP CONSTRAINT langue_pk;
       public         user    false    196            �
           2606    19618    livre_auteur livre_auteur_pk 
   CONSTRAINT     g   ALTER TABLE ONLY public.livre_auteur
    ADD CONSTRAINT livre_auteur_pk PRIMARY KEY (isbn, auteur_id);
 F   ALTER TABLE ONLY public.livre_auteur DROP CONSTRAINT livre_auteur_pk;
       public         user    false    210    210            �
           2606    19613    livre_genre livre_genre_pk 
   CONSTRAINT     _   ALTER TABLE ONLY public.livre_genre
    ADD CONSTRAINT livre_genre_pk PRIMARY KEY (isbn, nom);
 D   ALTER TABLE ONLY public.livre_genre DROP CONSTRAINT livre_genre_pk;
       public         user    false    209    209            �
           2606    19608    livre livre_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT livre_pk PRIMARY KEY (isbn);
 8   ALTER TABLE ONLY public.livre DROP CONSTRAINT livre_pk;
       public         user    false    208            �
           2606    19603    paragraphe paragraphe_pk 
   CONSTRAINT     h   ALTER TABLE ONLY public.paragraphe
    ADD CONSTRAINT paragraphe_pk PRIMARY KEY (decription_id, ordre);
 B   ALTER TABLE ONLY public.paragraphe DROP CONSTRAINT paragraphe_pk;
       public         user    false    207    207            �
           2606    19634    pret pret_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.pret
    ADD CONSTRAINT pret_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.pret DROP CONSTRAINT pret_pk;
       public         user    false    213            �
           2606    19576    utilisateur utilisateur_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.utilisateur DROP CONSTRAINT utilisateur_pk;
       public         user    false    202            �
           1259    19577    utilisateur_idx    INDEX     O   CREATE UNIQUE INDEX utilisateur_idx ON public.utilisateur USING btree (email);
 #   DROP INDEX public.utilisateur_idx;
       public         user    false    202            �
           2606    19645 #   livre_auteur auteur_auteur_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre_auteur
    ADD CONSTRAINT auteur_auteur_livre_fk FOREIGN KEY (auteur_id) REFERENCES public.auteur(id);
 M   ALTER TABLE ONLY public.livre_auteur DROP CONSTRAINT auteur_auteur_livre_fk;
       public       user    false    210    2738    200            �
           2606    19655 %   exemplaire bibliotheque_exemplaire_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT bibliotheque_exemplaire_fk FOREIGN KEY (bibliotheque) REFERENCES public.bibliotheque(nom);
 O   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT bibliotheque_exemplaire_fk;
       public       user    false    2743    212    203            �
           2606    19665    livre description_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT description_livre_fk FOREIGN KEY (description_id) REFERENCES public.description(id);
 D   ALTER TABLE ONLY public.livre DROP CONSTRAINT description_livre_fk;
       public       user    false    208    2747    206            �
           2606    19670 $   paragraphe description_paragraphe_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.paragraphe
    ADD CONSTRAINT description_paragraphe_fk FOREIGN KEY (decription_id) REFERENCES public.description(id);
 N   ALTER TABLE ONLY public.paragraphe DROP CONSTRAINT description_paragraphe_fk;
       public       user    false    2747    206    207            �
           2606    19640    livre editeur_livre_fk    FK CONSTRAINT     z   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT editeur_livre_fk FOREIGN KEY (editeur_id) REFERENCES public.editeur(id);
 @   ALTER TABLE ONLY public.livre DROP CONSTRAINT editeur_livre_fk;
       public       user    false    198    2736    208            �
           2606    19690    pret exemplaire_pret_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pret
    ADD CONSTRAINT exemplaire_pret_fk FOREIGN KEY (exemplaire_id) REFERENCES public.exemplaire(id);
 A   ALTER TABLE ONLY public.pret DROP CONSTRAINT exemplaire_pret_fk;
       public       user    false    2757    212    213            �
           2606    19660     livre_genre genre_livre_genre_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.livre_genre
    ADD CONSTRAINT genre_livre_genre_fk FOREIGN KEY (nom) REFERENCES public.genre(nom);
 J   ALTER TABLE ONLY public.livre_genre DROP CONSTRAINT genre_livre_genre_fk;
       public       user    false    209    2745    204            �
           2606    19635    livre langue_livre_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.livre
    ADD CONSTRAINT langue_livre_fk FOREIGN KEY (langue) REFERENCES public.langue(nom);
 ?   ALTER TABLE ONLY public.livre DROP CONSTRAINT langue_livre_fk;
       public       user    false    208    2734    196            �
           2606    19680 "   livre_auteur livre_auteur_livre_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.livre_auteur
    ADD CONSTRAINT livre_auteur_livre_fk FOREIGN KEY (isbn) REFERENCES public.livre(isbn);
 L   ALTER TABLE ONLY public.livre_auteur DROP CONSTRAINT livre_auteur_livre_fk;
       public       user    false    210    2751    208            �
           2606    19675    exemplaire livre_exemplaire_fk    FK CONSTRAINT     |   ALTER TABLE ONLY public.exemplaire
    ADD CONSTRAINT livre_exemplaire_fk FOREIGN KEY (isbn) REFERENCES public.livre(isbn);
 H   ALTER TABLE ONLY public.exemplaire DROP CONSTRAINT livre_exemplaire_fk;
       public       user    false    212    2751    208            �
           2606    19685     livre_genre livre_livre_genre_fk    FK CONSTRAINT     ~   ALTER TABLE ONLY public.livre_genre
    ADD CONSTRAINT livre_livre_genre_fk FOREIGN KEY (isbn) REFERENCES public.livre(isbn);
 J   ALTER TABLE ONLY public.livre_genre DROP CONSTRAINT livre_livre_genre_fk;
       public       user    false    209    2751    208            �
           2606    19650    pret utilisateur_pret_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.pret
    ADD CONSTRAINT utilisateur_pret_fk FOREIGN KEY (utilisateur_id) REFERENCES public.utilisateur(id);
 B   ALTER TABLE ONLY public.pret DROP CONSTRAINT utilisateur_pret_fk;
       public       user    false    213    2741    202            Q      x�3��/���K���������� ;�      T   9   x�s�L���/�8���4U!95��(1'��	E8%�X!?3��prb^bQJ1W� �Ob      W   !   x�3���2� �D��3a"b���� �V@      O   "   x�3�tO����M,JQ�J-�K-.N����� r��      ]   V  x���=R�0��::E. ���Jj9�I4�g2��;q.�����
{_Y^w()?y�,S�/��e�=޿�>>��T���r�ƃ.��@A�sw�����$�e�ݝ��r?o��X׭��轝Ga@!�0�a��c&f�Q�z+,��sp(�(($�9l��¬�6�� ���5�P�QPH(�sئ�I�m�2��c�E�C�Ga@!�a%E2
���GX���F��X�v
=

	����<�-z, d�L�J��2*e���8�*}�U	++��J��0���0Y:z
����Q���P)ӡR���J���Ja�>�*������!%�      U   �   x�M�=�0�w���-P!��bb1�j,��R���s�b��{z?_S�<X�wd2hFʥ*Avڿf�Ќ?���٠�\�&8�a��f2#8I)%��e���5�n����dR����5t���˷8���P�Ʉ��� ~��?,      M   %   x�s+J�;�<1���1/=L���&�p��qqq ̽
�      Y     x�uнN�0��9y�۲�8���RCED%&7��E��9���aC�5�b$@��Û���;_]Ĕ��8�ip#ߡ0M#�n�N_�}B��4��JZ�K%�I@IB��4�/k�}	eC~��,O��?d���x����%��_`�@Ҁz��̈́EB��5Z��C]}<���c#��lK�_��0�ֲ�3O��Iz��a5,��b�:����|9�I6�{VS�����[�����]76��H����X���zm�C����l����x<��#��k      [   ;   x�]˻  �Zvр�|����XH{�!W����6!<������V@��Dt �5t      Z   d   x�m�;� E��ً��08�p6�4h��Őh���9��8��D#��~XR�S=I�y�Gɵ�;^��g�Y o� fz�\�-#���3��B��÷��.nT9      X   �	  x��X=���u��6��*�����⹊�I�%EJp3�]�0�����ST�n8R�R8L�u���8�� �����y�ٳ�^;�j6�3��왱���+���6��kS�I�߻�O�Ɠ�m���g܀��6μ��`�O�+�����LIѸ��R��}�8��2���|�n<a�9x���f�2�3=�+۹��Ɵ`Vm���Z.OM�up �ƅ�w�s�V�q���`��<8���
��c��{;��b��B(���눉���0>�x�<OIu<m����eqL���Ě�g��S'��v��{�s��l6kz���Np�GR�3q�pe�SD`qފ������2lk�Ƽu������v��6����I�i�!YB�j�Z��*����m�<��~�$�0��s��}*�Ɣ�e�u}EH�וff�6��hO�o�Pa,C_wJ�����`�_✒����$;/����<������?�o[��$Ҳ���g��&iJ����@��n}`���z �Q_R��`�˽����k���_����-S���9��Ъ���O�|~����������9b���c���%�^����=� �
��Q�ݧ��,�!\�}Xx�Ka�ַDp1����$�`^��!�����?�D�X0]y\L����t�
҄���H�b��ٹX ���f�M
mU�S`(ν������%�z�9N����Ƌ�|���/�m~Yj����&��GHĆy���C��� ���{��f�Ϟ�Ԯ^|�����:�{��>z:u���2��E(XS�x���)���}�U��=\�ݧXD.x3���ԑ� �V���4XGx�EJh:Ř��4��/&�Q��˵| }�A�!�X~.�Z����dƚ�o�}��d��~�*^�v������I;��ʻ�['"J�1�/���X
D�x����K�[H�7 �&� 3#(@��W�s�7�x�C��Kķ��!/��|��0KT}����̣aуch��+��u��l�BW��S�t�����k!��@�R�c�f��Y���i�:%�E5�█��a���>��*V
��|>TdF���a"~`Ȟ�$<��R6X3rL^uy��z��m#E�>K9`y*O���܍��M��]3ئ��(2;��O�Gd+DuUsM�q������1��ԣ�p�_�P˧s^��p�I!����)J���� ŉ�@*!�AX<`iu�q��P�3��!���sZc��K@���HVw	�!�����n� &��^Bw����A��Gr'θ�� � �J�$)�85>��KB\������'�}��pY�j�-qe�(Gm�q�����ʶ��VQ���z�;�N;)�L ,�z��d,�ݸ
1[���"9/��/Y�n��ۯ~����-�o������*u�z�b�I6�U=Y�餡+$3�H���n%-��$`"���G�u��P9\ǭ�f>�(<��bi%��Y1�*7����LB�͵)�{�TzU������dg��0}mI*���e����\2L��Omwp6R��a��:��r�/Aa� /ҧ�%�&��O���*���q|d\��8=)�b�'L)��3(����|ɘ��(ѐ5K˖^�j��=�6�U[/����m��{��5y� �]�|��Kݙ�e�Qw��04����fN���zbЕ �� "��$3�AtX�8�]K<Xms:����a�I��?��ٸ3�u������o���m�
'r4x�\+ E�x|&�	��}��oK��
e��p9p 9��`�6W{�\8��k�#�9av88;�E���7*�8�P���~9�[%ɀ�T.>Գ�n�
�k;����{��2��E������u��哚�FL@�ދn�����aWUc��6J1�㠃.�E��p �e�Qb��	�[~;�bEP;������_�3,�p{��T�Ká�v���d6_tE����O��z�w��1� ��
>��FJ�<�j_Du��؉���Na����l��z�bR�
�@�?�ɝ�Z�������ѳ;^���C.g����΢�u^f��<mٙ��,�l�Z���:Ǉn�Yf�����!W������*C.�A�q2�`�y��r���ܱ���au;����$G��~fi	����S�.E�mn��~I;Y�o��Ӭ�l=^��_*��B)�dF���G����W��J��%t�C�%F8@*_�>餗
�0�$���x�
P��
0t�٪�lda��Ң`�,R��L����Y� D��87�ߐT��bh�E�Z?�E\F;c�K
���}_��}X�߬���~Q�8���]�,��B��RD��ʼ���y!��~P�D
K$���{�3��?����IJ��ޙ������rz�6���V�{���.,g�#�;���5�{����"�B��"|
S��Xȝ*�Hٖ��4�U�'߸D'QR���z*!�s"`$!�dŕT;�>��
^�rB�3x�PX�Ŀ�~sss�q�)�      ^   .   x�3�420��50�50���,�4�4�2���AEӀ���\1z\\\ ��      S   v   x�3��J-Jͭ���/I�+vH�M���K����pz^Ytxen%��{��s��GxnX��yUi����I@���Y��_q�cx~�~��Qdy�-g�A��g��wU��Y�Q^�Z�	W� :w&4     