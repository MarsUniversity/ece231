% ------
% This is a handout document class. It is based on the article class. It is design for creating handouts for a college class
% Created By: Roger Cortesi, 27 JUN 2007
% ----
% ---- Identification -----

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{handout}

% ---- Initial Code ----

\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{mathrsfs}
\RequirePackage{amsfonts}
\RequirePackage{color}
\RequirePackage[pdftex]{graphicx}
\RequirePackage{graphicx}

\DeclareGraphicsExtensions{.pdf,.jpeg,.png}

%\usepackage{amssymb,amsmath,mathrsfs}

\newboolean{@showsolns} % The boolean which will determine if the solutions are displayed.
\pagenumbering{arabic}



% ---- Declare Options ----

\DeclareOption{solution}{\setboolean{@showsolns}{true}}
\DeclareOption*

% ---- Execution of Options ----

\ProcessOptions \relax

% --- Package Loading ----

\LoadClass{article}

% ---- Main Code ----

% --- Setup the Page Layout ---
	\setlength\textwidth{6.5in}
	\setlength\textheight{9.0in}
	\setlength\oddsidemargin{0in}
	\setlength\evensidemargin{1in}
	\setlength\topmargin{-0.5in}
	\setlength\parindent{0in}
	\setlength\parskip{0.5em}

% --- Define Some Useful Commands ---
	% Define the default values for these commands
	\newcommand{\CourseTitle}{\ }
	\newcommand{\HandoutTitle}{\ }
	\newcommand{\DueDate}{}
	\newcommand{\Instructor}{}
	\newcommand{\Semester}{}
	\newcommand{\Blank}{}

	% change the values if the user sets these commands
	\newcommand{\SetCourseTitle}[1]{\renewcommand{\CourseTitle}{#1}}
	\newcommand{\SetHandoutTitle}[1]{\renewcommand{\HandoutTitle}{#1}}
	\newcommand{\SetDueDate}[1]{\renewcommand{\DueDate}{Due: #1}}
	\newcommand{\SetInstructor}[1]{\renewcommand{\Instructor}{#1}}
	\newcommand{\SetSemester}[1]{\renewcommand{\Semester}{#1}}
	\newcommand{\ShowAllBlanks}{\renewcommand{\Blank}{\large Name:\rule{2in}%
	{0.5pt} Section:\rule{0.75in}{0.5pt} Date:\rule{0.75in}{0.5pt}\\}}
	
	% redefine the make title command
	\renewcommand\maketitle{
		\thispagestyle{handouttitle}
		\begin{center}
		\LARGE{\HandoutTitle} \\
		\large\textbf{\DueDate} \\
		\end{center}
	}

	\newcommand{\maketitleinst}{
		\thispagestyle{handouttitle}
		\begin{center}
		\LARGE{\HandoutTitle} \\
		\large{\Instructor} \\
		\end{center}
	}

	% Redefine the sectioning commands \section \subsection and \subsubsection
	\renewcommand\section{\@startsection
		{section}{2}{0mm}{0.1\baselineskip}{0.1\baselineskip}{\normalfont\large\textbf}
	}
	\renewcommand\subsection{\@startsection
		{subsection}{2}{0mm}{0.1\baselineskip}{0.1\baselineskip}{\normalfont\normalsize\textbf}
	}
	\renewcommand\subsubsection{\@startsection
		{subsubsection}{2}{0mm}{0.1\baselineskip}{0.1\baselineskip}{\normalfont\normalsize\textbf}
	}
	
	% Create a question environment
	\newcounter{questionnumber}
	\newenvironment{questions}
		{	\begin{enumerate}
			\setcounter{enumi}{\thequestionnumber}
		}
		{	\setcounter{questionnumber}{\theenumi}
			\end{enumerate}
		}
	
	% Create a solution environment and code to toggle showing and hiding solutions.
	\ifthenelse{\NOT\isundefined{\makesolution}}{\setboolean{@showsolns}{true}}{}
	
	\ifthenelse{\boolean{@showsolns}}{}{\setboolean{@showsolns}{false}} % if the solution option was not passed don't set default to not display solutions.
	
	% The color to display the solution and solution stamps in.
	\newcommand{\solncolor}{blue}
	% The command to change the color for the solutions.
	\newcommand{\setsolncolor}[1]{\renewcommand{\solncolor}{#1}}

	% The solution environment.
	\newenvironment{solution}{\color{\solncolor} \em }{}
	
	% \showsoln displays the solutions for the document.
	\newcommand{\showsoln}{\setboolean{@showsolns}{true} \pagestyle{handout}} 
	% \hidesoln hides the solutions for the document.
	\newcommand{\hidesoln}{\setboolean{@showsolns}{false}}
	% This is the solution stamp put at the top and bottom of each page.
	\newcommand{\solnstamp}{\large \textcolor{\solncolor}{\textbf{SOLUTION}}}

	%The command \soln{length}{text} takes two arguments.
	%The length is the amount of vertical space to display when the solution is not shown.
	%The text is the text of the solution to display when the solution is displayed.
	\newcommand{\soln}[2]{
	\ifthenelse{\boolean{@showsolns}}
		{
			\begin{solution}{#2}
			\end{solution}
		}
		{\vspace{#1}}
	}

	%\ExecuteOptions{solution}
% --- Define the Header and Footer Styles ---

	% The style for the page with \maketitle called on it.
	\fancypagestyle{handouttitle} {
		\renewcommand\headrulewidth{0.5pt}
		\renewcommand\footrulewidth{0.5pt}
		\chead{}
		\cfoot{\thepage\ of \pageref{LastPage}}
		\ifthenelse{\boolean{@showsolns}}
			{
			\lhead{ \solnstamp \\ \large \CourseTitle }			
			\lfoot{\solnstamp}
			}
			{
			\lhead{ \large \CourseTitle }	
			\lfoot{}
			}
		\rhead{\Blank \large \Semester}
		
	}

	% The style for pages without \maketitle called on it.
	\fancypagestyle{handout} {
		\renewcommand\headrulewidth{0.5pt}
		\renewcommand\footrulewidth{0.5pt}
		\cfoot{\thepage\ of \pageref{LastPage}}
		\ifthenelse{\boolean{@showsolns}}
			{
			\chead{ \solnstamp \\ \large \CourseTitle\  - \Semester \\ \textbf{\large \HandoutTitle} }
			\lfoot{\solnstamp}
			\rhead{}
			\lhead{}
			}
			{
			\chead{ \large \CourseTitle\  - \Semester \\ \textbf{\large \HandoutTitle}\ }
			\lfoot{}
			\rhead{}
			\lhead{}
			}
	}
	
% Set the default page style to handout.
	\pagestyle{handout}


% create some commonly used commands
\newcommand{\mb}[1]{\mathbf{#1}}
\newcommand{\mat}[1]{\begin{bmatrix}#1\end{bmatrix}}
\newcommand{\pd}[2]{\frac{\partial #1}{\partial #2}}

% Provide Good Code Display
\RequirePackage{listings}
\definecolor{CodeBackground}{rgb}{0.95,0.95,0.95}
\definecolor{DarkGreen}{rgb}{0.0,0.5,0.0}
\lstset{language=matlab}
\lstset{linewidth=6in}
\lstset{xleftmargin=0.3in}
\lstset{frame=single}
\lstset{framesep=0.1in}
\lstset{captionpos=b}
\lstset{basicstyle=\small}
\lstset{keywordstyle=\color{blue}\bfseries}
\lstset{commentstyle=\color{DarkGreen}}
\lstset{backgroundcolor=\color{CodeBackground}}

\lstnewenvironment{matlabCode}[1]{\lstset{language=matlab} \lstset{#1}}{}
\lstnewenvironment{cCode}[1]{\lstset{language=c} \lstset{#1}}{}
\lstnewenvironment{javaCode}[1]{\lstset{language=java} \lstset{#1}}{}
\lstnewenvironment{fortranCode}[1]{\lstset{language=fortran} \lstset{#1}}{}
\lstnewenvironment{latexCode}[1]{\lstset{language=[latex]tex} \lstset{#1}}{}
\lstnewenvironment{noCode}[1]{\lstset{language=} \lstset{#1}}{}
