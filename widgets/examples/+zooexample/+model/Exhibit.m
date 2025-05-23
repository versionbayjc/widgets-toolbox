classdef Exhibit < wt.model.BaseModel
    % Implements the model class for an exhibit
%   Copyright 2025 The MathWorks Inc.


    %% Public Properties
    properties (AbortSet, SetObservable)

        % Point location of the exhibit on the map
        Location (1,2) double

        % Enclosures within this exhibit
        Enclosure (:,1) zooexample.model.Enclosure

    end %properties


    %% Dependent, Read-Only Properties
    properties (Dependent, SetAccess = private)

        % Flat list of all animals found within the enclosures
        AllAnimal (:,1) zooexample.model.Animal

        % Total number of enclosures
        NumEnclosures (1,1) double

        % Total number of animals within all included enclosures
        NumAnimals (1,1) double

    end %properties

    % Accessors
    methods

        function value = get.AllAnimal(obj)
            if isempty(obj.Enclosure)
                value = zooexample.model.Animal.empty(0,1);
            else
                value = vertcat(obj.Enclosure.Animal);
            end
        end

        function value = get.NumEnclosures(obj)
            value = numel(obj.Enclosure);
        end

        function value = get.NumAnimals(obj)
            value = numel(obj.AllAnimal);
        end

    end %methods


    %% Destructor
    methods
        function delete(obj)

            % Because we are using composition, any Enclosure objects will
            % be deleted when this object is deleted
            delete(obj.Enclosure);

        end %function
    end %methods


    %% Protected methods
    methods (Access = protected)

        function props = getAggregatedModelProperties(~)
            % Returns a list of aggregated model property names

            % If a listed property is also a wt.model.BaseModel, property
            % changes that trigger the ModelChanged event will be passed up
            % the hierarchy to this object.

            props = "Enclosure";

        end %function

    end %methods

end %classdef