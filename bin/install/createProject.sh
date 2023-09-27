#!/bin/bash
if ! ${0%/*}/message_create_container.sh ; then
   exit 1
fi

while read line  
do   
    if [ ! -z "$line" ]
    then
        export $line
    fi
done < ${0%/*}/../../.env
if [[ "$1" = "--helps" ]]
then
   #docker exec -it $NAME_PROJECT_CONTAINER ng "$@"
   #TAB= array[["--commit","Initial git repository commit information.","","booleantrue"],["--create-application","Create a new initial application project in the 'src' folder of the new workspace. When false, creates an empty workspace with no initial application. You can then use the generate application command so that all applications are created in the projects folder.","","booleantrue"],["--defaults","Disable interactive input prompts for options with a default.","","booleanfalse"],["--directory","The directory name to create the workspace in.","","string"],["--dry-run","Run through and reports activity without writing out results.","","booleanfalse"],["--force","Force overwriting of existing files.","","booleanfalse"],["--help","Shows a help message for this command in the console.","","boolean"],["--inline-style","Include styles inline in the component TS file. By default, an external styles file is created and referenced in the component TypeScript file.","Aliases: -s","boolean"],["--inline-template","Include template inline in the component TS file. By default, an external template file is created and referenced in the component TypeScript file.","Aliases: -t","boolean"],["--interactive","Enable interactive input prompts.","","booleantrue"],["--minimal","Create a workspace without any testing frameworks. (Use for learning purposes only.)","","booleanfalse"],["--new-project-root","The path where new projects will be created, relative to the new workspace root.","","stringprojects"],["--package-manager","The package manager used to install dependencies.","","npm | yarn | pnpm | cnpm"],["--prefix","The prefix to apply to generated selectors for the initial project.","Aliases: -p","stringapp"],["--routing","Generate a routing module for the initial project.","","boolean"],["--skip-git","Do not initialize a git repository.","Aliases: -g","booleanfalse"],["--skip-install","Do not install dependency packages.","","booleanfalse"],["--skip-tests","Do not generate "spec.ts" test files for the new project.","Aliases: -S","booleanfalse"],["--standalone","Creates an application based upon the standalone API, without NgModules.","","booleanfalse"],["--strict","Creates a workspace with stricter type checking and stricter bundle budgets settings. This setting helps improve maintainability and catch bugs ahead of time. For more information, see https:/angular.io/guide/strict-mode","","booleantrue"],["--style","The file extension or preprocessor to use for style files.","","css | scss | sass | less"],["--view-encapsulation","The view encapsulation strategy to use in the initial project.","","Emulated | None | ShadowDom"]]
   echo "Options:"
   echo "   --commit  Initial git repository commit information.  	booleantrue"
   echo "   --create-application	Create a new initial application project in the 'src' folder of the new workspace. When false, creates an empty workspace with no initial application. You can then use the generate application command so that all applications are created in the projects folder.		booleantrue"
   #echo "   --defaults	Disable interactive input prompts for options with a default.		booleanfalse"
   echo "   --directory	The directory name to create the workspace in.		string"
   echo "   --dry-run	Run through and reports activity without writing out results.		booleanfalse"
   echo "   --force	Force overwriting of existing files.		booleanfalse"
   echo "   --help	Shows a help message for this command in the console.		boolean"
   echo "   --inline-style	Include styles inline in the component TS file. By default, an external styles file is created and referenced in the component TypeScript file.	Aliases: -s	boolean"
   echo "   --inline-template	Include template inline in the component TS file. By default, an external template file is created and referenced in the component TypeScript file.	Aliases: -t	boolean"
   echo "   --interactive	Enable interactive input prompts.		booleantrue"
   echo "   --minimal	Create a workspace without any testing frameworks. (Use for learning purposes only.)		booleanfalse"
   echo "   --new-project-root	The path where new projects will be created, relative to the new workspace root.		stringprojects"
   echo "   --package-manager	The package manager used to install dependencies.		npm | yarn | pnpm | cnpm"
   echo "   --prefix	The prefix to apply to generated selectors for the initial project.	Aliases: -p	stringapp"
   #echo "   --routing	Generate a routing module for the initial project.		boolean"
   #echo "   --skip-git	Do not initialize a git repository.	Aliases: -g	booleanfalse"
   echo "   --skip-install	Do not install dependency packages.		booleanfalse"
   echo "   --skip-tests	Do not generate \"spec.ts\" test files for the new project.	Aliases: -S	booleanfalse"
   echo "   --standalone	Creates an application based upon the standalone API, without NgModules.		booleanfalse"
   echo "   --strict	Creates a workspace with stricter type checking and stricter bundle budgets settings. This setting helps improve maintainability and catch bugs ahead of time. For more information, see https:/angular.io/guide/strict-mode		booleantrue"
   echo "   --style	The file extension or preprocessor to use for style files.		css | scss | sass | less"
   echo "   --view-encapsulation	The view encapsulation strategy to use in the initial project.		Emulated | None | ShadowDom"
else

   if [ -e ${0%/*}/../../tmp_install/type_install ]
   then
   while read line  
   do   
      if [ ! -z "$line" ]
      then
         export $line
      fi
   done < ${0%/*}/../../tmp_install/type_install
   fi

   if [ -z "$IS_CREATE_FOLDER" ]
   then
      if ! ${0%/*}/project_bash.sh "ng new $FOLDER_PROJECT --routing --defaults --skip-git $@" ; then
         exit 1
      else
         echo "IS_CREATE_FOLDER=false" >> "${0%/*}/../../tmp_install/type_install"
      fi
   fi
   if ! ${0%/*}/project_bash.sh "chmod 777 -R $FOLDER_PROJECT" ; then
      exit 1
   fi
   if ! ${0%/*}/in_install.sh ; then
      exit 1
   fi
   #docker exec $NAME_PROJECT_CONTAINER bash -c "cp .gitignore $FOLDER_PROJECT/"

   if [ -e ${0%/*}/packages_install.list ]
   then
      while read line  
      do   
         if [ ! -z "$line" ]
         then
            if ! ${0%/*}/project_bash.sh "cd $FOLDER_PROJECT/ && npm install $line" ; then
            exit 1
            fi
         fi
      done < ${0%/*}/packages_install.list
   fi

fi

exit 0
